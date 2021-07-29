local opts = {
	leader = "<c-g>",
	create_buffer = "c",
	remove_buffer = "q",
    commands = {
        bufdelete = "bdelete",
        buffer = "buffer!"
    },
	-- Enable this binding in all modes by default
	supported_modes = { "n", "v", "i", "o", "c", "t" },
}

local function jump_to_buf(buf_num)
	buf_num = tonumber(buf_num)

	local list = vim.tbl_map(function(v)
		return v.bufnr
	end, vim.fn.getbufinfo({ buflisted = 1 }))

	if buf_num > #list then
		return
	end

	-- vim.schedule_wrap(function()
		-- vim.api.nvim_set_current_buf(list[buf_num])
	-- end)

    -- TODO: Investigate how to override the textlock to get the behavior of :buffer!
	-- vim.api.nvim_set_current_buf(list[buf_num])
	vim.cmd(opts.commands.buffer .. " " .. list[buf_num])
end

local function setup(user_opts)
	opts = vim.tbl_deep_extend("force", opts, user_opts or {})
	for i = 1, 9 do
		for _, mode in ipairs(opts.supported_modes) do
			vim.api.nvim_set_keymap(
				mode,
				opts.leader .. i,
				"<cmd>lua require('buf-num-nav').jump_to_buf('" .. i .. "')<cr>",
				{ silent = true, noremap = true }
			)
			vim.api.nvim_set_keymap(
				mode,
				opts.leader .. opts.create_buffer,
				":edit! ",
				{ silent = false, noremap = true }
			)
			vim.api.nvim_set_keymap(
				mode,
				opts.leader .. opts.remove_buffer,
				"<cmd>" .. opts.commands.bufdelete .. "<cr>",
				{ silent = true, noremap = true }
			)
		end
	end
end

return {
	setup = setup,
	jump_to_buf = jump_to_buf,
}
