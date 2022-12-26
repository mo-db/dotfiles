-----------------
--Nvim Config--
-----------------

-- Packer
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-lualine/lualine.nvim'
  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

    },
  }
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

-- 'ellisonleao/gruvbox.nvim'
vim.o.termguicolors = true
vim.cmd [[ colorscheme gruvbox ]]

-- 'nvim-treesitter/nvim-treesitter'
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "python" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
  },
}

-- 'nvim-lualine/lualine.nvim'
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'gruvbox',
    component_separators = '|',
    section_separators = '',
  },
}

-- 'williamboman/mason.nvim'
require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "sumneko_lua", "solargraph", "clangd" }
}

-- 'neovim/nvim-lspconfig'


-- 'j-hui/fidget.nvim'
require('fidget').setup()
