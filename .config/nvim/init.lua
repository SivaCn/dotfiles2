
--
-- Setting up VIM low level commands
vim.cmd("set number")
vim.g.mapleader = " "

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'williamboman/mason.nvim'

    use 'EdenEast/nightfox.nvim'
    vim.cmd('colorscheme nightfox')
end)

require("mason").setup()
