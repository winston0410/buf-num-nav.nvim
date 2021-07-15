local opts = {
	leader = "<c-g>",
    create_buffer = "c",
    remove_buffer = "q",
    -- Enable this binding in all modes by default
    supported_modes = { "n", "v", "i", "o", "c", "t" }
}

local function jump_to_buf(buf_num)
    buf_num = tonumber(buf_num)
    local list = vim.api.nvim_list_bufs()
    print('check buf list', vim.inspect(list))
    if buf_num > #list then
        return
    end
    vim.api.nvim_set_current_buf(list[buf_num])
end

local function setup(user_opts)
	opts = vim.tbl_extend("force", opts, user_opts or {})
    -- To wipe out ephemeral buffer without disturbe the cyclelist
    -- https://github.com/neovim/neovim/issues/13429
    -- vim.o.bufhidden = "wipe"
    for i=1,9 do
        for _, mode in ipairs(opts.supported_modes) do
            vim.api.nvim_set_keymap(mode, opts.leader .. i, "<cmd>lua require('buf-num-nav').jump_to_buf('" .. i .. "')<cr>", { silent = true, noremap = true })
			vim.api.nvim_set_keymap(mode, opts.leader .. opts.create_buffer, ":edit! ", { silent = false, noremap = true })
			vim.api.nvim_set_keymap(mode, opts.leader .. opts.remove_buffer, "<cmd>bdelete<cr>", { silent = true, noremap = true })
        end
    end
end

return {
    setup = setup,
    jump_to_buf = jump_to_buf
}
