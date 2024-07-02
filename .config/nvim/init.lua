
--
-- Setting up VIM low level commands
vim.cmd("set number")
vim.cmd("set cursorline")
vim.cmd("set cursorcolumn")
vim.cmd("set scrolloff=10")
-- Set right margin
vim.cmd("set colorcolumn=120")
-- Change the current directory based on the open file
vim.cmd("set autochdir")

vim.g.mapleader = ","

require('packer').startup(function(use)

    -- Run :PackerInstall to install the below Plugins

    use 'wbthomason/packer.nvim'
    use 'williamboman/mason.nvim'

    use 'nvim-tree/nvim-web-devicons'

    use 'EdenEast/nightfox.nvim'
    vim.cmd('colorscheme nightfox')

    -- use 'lewis6991/gitsigns.nvim'
    -- use 'nvim-lua/plenary.nvim'

    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
        require('gitsigns').setup()
      end
    }
end)

require("mason").setup()
require'lspconfig'.pyright.setup{}

