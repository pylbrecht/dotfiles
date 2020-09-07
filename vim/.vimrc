" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/calendar-vim'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'

call plug#end()

filetype plugin indent on

" open splits more naturally
set splitright
set splitbelow

" set backup/swap dir
set backupdir=~/.vim/backup
set directory=~/.vim/swap

" copy everything to system's clipboard
set clipboard=unnamed

" map leader to SPACE
let mapleader = ","

" remap yank inconsistency
nnoremap Y y$

" backspace
set backspace=indent,eol,start

" encoding
set encoding=utf-8

" clear last search pattern
nnoremap <BACKSPACE> :noh<CR>

" remap colon
nnoremap ; :
nnoremap q; q:

" highlight current line
set cursorline

" show line numbers
set number
set relativenumber

" tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" split motion
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" easier moving code blocks
vnoremap < <gv
vnoremap > >gv

" keep 5 lines on top/bottom while scrolling
set scrolloff=5

" colorscheme
set t_Co=256
set background=dark
let g:gruvbox_italic=0
colors gruvbox

" syntax highlighting
syntax on

" indentation
set tabstop=4
set shiftwidth=4
set expandtab

" search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" vimwiki
let g:vimwiki_list = [{'path': '~/notes', 'path_html': '~/notes/html', 'ext': '.md', 'syntax': 'markdown'}]

" Map :Files to CTRL-P
nnoremap <C-p> :Files<Cr>

" Use ripgrep as grep prog
set grepprg=rg\ -S\ --vimgrep
set grepformat^=%f:%l:%c:%m

" vim-airline
let g:airline#extensions#cursormode#enabled = 0
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''

" startify
let g:startify_change_to_dir = 0
