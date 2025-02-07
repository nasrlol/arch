-- INSTALL PACKER
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd 'packadd packer.nvim'
end

-- Plugin Management
require('packer').startup(function(use)

  -- Plugin manager
  use 'wbthomason/packer.nvim'

  -- Essential plugins
  use 'preservim/nerdtree'
  use 'airblade/vim-gitgutter'
  use 'junegunn/fzf.vim'
  use 'dense-analysis/ale'
  use 'nvim-treesitter/nvim-treesitter'
  use 'neoclide/coc.nvim' 
  use 'tpope/vim-commentary'

  -- Language-specific plugins
  use 'vim-scripts/c.vim'
  use 'sheerun/vim-polyglot'
  use 'jiangmiao/auto-pairs'
  use 'mattn/emmet-vim'
  use 'pangloss/vim-javascript'
  use 'mxw/vim-jsx'
  use 'neovim/nvim-lspconfig' 

  -- Theme
  use {
    'rebelot/kanagawa.nvim',
    config = function()
      require('kanagawa').setup({
        compile = false,
        undercurl = true,
        commentStyle = { italic = true },
        functionStyle = { bold = true },
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = { bold = true },
        transparent = true,
        dimInactive = false,
        terminalColors = true,
        colors = {},
        overrides = function(colors) return {} end,
        theme = "wave",
      })
      vim.cmd("colorscheme kanagawa")
    end
  }

  -- Diffview for Git diffing
  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require("diffview").setup({})
    end
  }
end)

-- Apply general settings
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.hidden = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.clipboard = 'unnamedplus'
vim.o.wildmenu = true
vim.o.laststatus = 2
vim.o.undofile = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.errorbells = false
vim.o.visualbell = false

-- Key Mappings
vim.api.nvim_set_keymap('n', '<F2>', ':NERDTreeFind<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F3>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', ':bd<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>z', ':bp<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>x', ':bn<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader><space>', ':noh<CR>', { noremap = true })

-- Treesitter Configuration
require('nvim-treesitter.configs').setup {
  ensure_installed = { 'c', 'cpp', 'python', 'javascript', 'html', 'css' },
  highlight = { enable = true },
}

-- ALE Configuration
vim.g.ale_linters = {
  python = { 'flake8' },
  javascript = { 'eslint' },
  c = { 'gcc' },
  cpp = { 'gcc' },
}
vim.g.ale_fixers = {
  ['*'] = { 'trim_whitespace', 'remove_trailing_lines' },
  python = { 'black' },
  javascript = { 'prettier' },
}

-- CoC.nvim Configuration for Autocompletion
vim.g.coc_global_extensions = {
  'coc-pyright',  -- Python support
  'coc-clangd',   -- C/C++ support
  'coc-tsserver', -- JavaScript/TypeScript support
  'coc-eslint',   -- ESLint
  'coc-prettier', -- Prettier
}

-- Diffview Key Mappings
vim.api.nvim_set_keymap('n', '<leader>do', ':DiffviewOpen<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dc', ':DiffviewClose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dh', ':DiffviewFileHistory<CR>', { noremap = true, silent = true })

