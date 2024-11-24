"*****************************************************************************
let vimplug_exists=expand('~/.vim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

let g:vim_bootstrap_langs = "c,html,javascript,python"
let g:vim_bootstrap_editor = "vim"				" vim

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'Yggdroot/indentLine'
Plug 'editor-bootstrap/vim-bootstrap-updater'

" nvim-treesitter for better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Additional plugins for languages
Plug 'jelera/vim-javascript-syntax'         " JavaScript Syntax
Plug 'davidhalter/jedi-vim'                " Python autocompletion
Plug 'morhetz/gruvbox'                     " Colorscheme
Plug 'junegunn/fzf.vim'                    " FZF support
Plug 'junegunn/fzf'                        " FZF installation


call plug#end()

" Required:
filetype plugin indent on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Fix backspace indent
set backspace=indent,eol,start

" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Using system clipboard
set clipboard=unnamedplus

" Bash-like completions
set wildmode=longest,list

" Disable swap files
set noswapfile

" Map leader to ,
let mapleader=','

" Enable hidden buffers
set hidden

set nocompatible
filetype off

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" Session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
let g:airline_powerline_fonts = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax enable           " Enable syntax highlighting
set ruler               " Show line and column numbers in the status line
set number              " Show line numbers

let no_buffers_menu=1

" Better command line completion 
set wildmenu

" Mouse support
set mouse=a

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = ''
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1
end

" Disable the blinking cursor.
set gcr=a:blinkon0


" Status bar
set laststatus=2

" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv


" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Treesitter configuration for better language parsing and highlighting
"*****************************************************************************
" Tree-sitter isn't directly supported in Vim, but you can use other highlighting plugins for better syntax highlighting.
" For example, 'vim-treesitter' could be used for some tree-sitter features, or a similar plugin.



"****************************************************************************
"" Initialize jedi-vim for Python files
autocmd FileType python call jedi#init_python()
"****************************************************************************

"*****************************************************************************
"" Color scheme setup
"*****************************************************************************
colorscheme gruvbox        " Set colorscheme to gruvbox
set background=dark       " Dark background for better color contrast

" Enable line numbers and highlighting for the current line
set number
set cursorline
