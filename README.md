# nvim-move-mode

A Neovim plugin that adds a move mode for easy line and selection movement.

## Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim):


```lua
use {
'ebadidev/nvim-move-mode',
config = function()
require('move_mode').setup()
end
}
```

## Usage

Press `m` to toggle move mode. While in move mode, use the up and down arrow keys to move lines or selections. The mode will automatically deactivate after 5 seconds of inactivity.

## Configuration

You can customize the toggle key by passing an option to the setup function:
```lua
require('move_mode').setup({
toggle_key = '<A-m>' -- Use Alt+m to toggle move mode
})
```
## License

MIT
