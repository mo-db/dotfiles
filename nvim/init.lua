-----------------
--Nvim Config--
-----------------

-- Packer
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-lualine/lualine.nvim'
end)

-- Keymaps
local k = vim.keymap
k.set('i', 'jk', '<Esc>', {})

-- Options
local o = vim.o
o.number = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2


-- Vars
local g = vim.g
g.mapleader =';'
g.localleader ='\\'

-----------------
--Plugin Config--
-----------------

--gruvbox
vim.o.termguicolors = true
vim.cmd [[ colorscheme gruvbox ]]

--treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}

--lualine
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'gruvbox',
    component_separators = '|',
    section_separators = '',
  },
}
