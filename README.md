# Selenized color palette for NeoVIM

## Features

* Support for LSP and [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* Support for [GitSigns](https://github.com/lewis6991/gitsigns.nvim)
* Treesiter syntax highlighting

## Screenshots

![C Highligthing](https://raw.githubusercontent.com/calind/selenized.nvim/assets/images/hl-c.png)

![Go Highligthing](https://raw.githubusercontent.com/calind/selenized.nvim/assets/images/hl-golang.png)

![GitSigns](https://raw.githubusercontent.com/calind/selenized.nvim/assets/images/hl-gitsigns.png)

## Installation

Install the theme with your preferred package manager.

[lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{ "calind/selenized.nvim" }
```

[packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use { "calind/selenized.nvim" }
```

## Usage

Using vimL:


```vim
colorscheme selenized
```

Using Lua:

```lua
vim.cmd.colorscheme "selenized"
```

## Acknowlegement

This color scheme is based on https://github.com/jan-warchol/selenized.
