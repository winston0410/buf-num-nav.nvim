# buf-num-nav.nvim

Navigate buffers in neovim like in tmux with numbers.

Best served with a bufferline plugin like [bufferline](https://github.com/akinsho/nvim-bufferline.lua)

## Usage

Navigate to buffer 1 with `<LeaderKeyYouDefine>1`, navigate to buffer 2 with `<LeaderKeyYouDefine>2`, etc ...

This plugin support mapping up to `<LeaderKeyYouDefine>9`

## Installation

### `Paq.nvim`

```lua
paq{'winston0410/commented.nvim'}
```

### `vim-plug`

```lua
Plug 'winston0410/commented.nvim'
```

After installtion, call `setup()` to start using this plugin.

```lua
require("buf-num-nav").setup()
```

## Configuration

This is the default configuration:

```lua
local opts = {
	leader = "<c-g>",
    supported_modes = { "n", "v" }
}
```
