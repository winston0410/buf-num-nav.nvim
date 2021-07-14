local opts = {
	leader = "<c-g>",
}

local function jump_to_buf()

end

local function setup(user_opts)
	opts = vim.tbl_extend("force", opts, user_opts or {})
    for i=1,10 do
        print('check value', i)
    end
end

return {
    setup = setup
}
