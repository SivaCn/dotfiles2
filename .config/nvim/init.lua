
--
-- To Install Packer
-- git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
--
-- Setting up VIM low level commands
vim.cmd("set mouse=")  -- Disable Mouse
vim.cmd("set number")
vim.cmd("set cursorline")
vim.cmd("set cursorcolumn")
vim.cmd("set scrolloff=10")
-- Set right margin
vim.cmd("set colorcolumn=120")

-- Show the full file path in the status line
vim.opt.statusline:append('%F')

-- Change the current directory based on the open file
vim.cmd("set autochdir")

-- Enable case-insensitive search
vim.opt.ignorecase = true

-- Enable smart-case search
vim.opt.smartcase = true

vim.g.mapleader = ","

-- DEBUGGING
-- Insert python pdb snippet
vim.api.nvim_set_keymap('n', '<leader>pdb', 'Oimport pdb; pdb.set_trace()  # TODO: Remove This line<Esc>', { noremap = true, silent = true })
--
-- Insert celery rdb snippet
vim.api.nvim_set_keymap('n', '<leader>rdb', 'Ofrom celery.contrib import rdb; rdb.set_trace()  # TODO: Remove This line<Esc>', { noremap = true, silent = true })

-- Reload configuration without closing Neovim
vim.api.nvim_set_keymap('n', '<leader>r', ':source $MYVIMRC<CR>', { noremap = true, silent = true })

-- Map <leader>m to gt (next tab)
vim.api.nvim_set_keymap('n', '<leader>m', 'gt', {noremap = true, silent = true})
-- Map <leader>n to gT (previous tab)
vim.api.nvim_set_keymap('n', '<leader>n', 'gT', {noremap = true, silent = true})

-- Move current tab to the left
vim.api.nvim_set_keymap('n', '<S-Left>', ':tabmove -<CR>', {noremap = true, silent = true})
-- Move current tab to the right
vim.api.nvim_set_keymap('n', '<S-Right>', ':tabmove +<CR>', {noremap = true, silent = true})

-- Auto Removing trailing all whitespaces on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

require('packer').startup(function(use)

    -- Run :PackerInstall to install the below Plugins
    -- Run :PackerSync to refresh all the Plugins

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

    -- Treesitter - Provides better syntax highlighting and code understanding.
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
      end,
    }

    -- A blazing fast and easy to configure status line
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use 'folke/which-key.nvim'

end)

require("mason").setup()
require'lspconfig'.pyright.setup{}

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- or a list of languages
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
