-- init.lua

-- Ensure Packer is installed
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.cmd('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

-- Initialize Packer
require('packer').startup(function()
  use 'wbthomason/packer.nvim'         -- Packer manages itself
  use 'tpope/vim-commentary'           -- Easier Commenting
  use 'nvim-lualine/lualine.nvim'      -- Statusbar
  use 'nvim-tree/nvim-tree.lua'        -- File tree
  use 'christoomey/vim-tmux-navigator' -- vim tmux keybinds

  use { -- LSP
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }

  -- :PackerInstall or :PackerSync
end)

-- Bindings
vim.api.nvim_set_keymap('n', 'ZE', ':Ex<CR>', { noremap = true, silent = true })


-- Additions
vim.opt.clipboard="unnamedplus"

vim.cmd('syntax enable')
vim.cmd('set nu relativenumber')
vim.cmd('set nocompatible')
vim.cmd('set linebreak')
vim.cmd('set showbreak=+++')
vim.cmd('set textwidth=80')

vim.cmd('set showmatch')
vim.cmd('set visualbell')

vim.cmd('set hlsearch')
vim.cmd('set smartcase')
vim.cmd('set ignorecase')
vim.cmd('set incsearch')

vim.cmd('set autoindent')
vim.cmd('set shiftwidth=4')
vim.cmd('set smartindent')
vim.cmd('set smarttab')
vim.cmd('set softtabstop=4')

vim.cmd('set ruler')
vim.cmd('set undolevels=1000')
vim.cmd('set backspace=indent,eol,start')

