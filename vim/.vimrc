set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'junegunn/fzf.vim'
Plugin 'majutsushi/tagbar'
Plugin 'morhetz/gruvbox'
Plugin 'nvie/vim-flake8'
Plugin 'rust-lang/rust.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vimwiki/vimwiki'

" all of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" remove trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

" backspace
set backspace=indent,eol,start

" clear last search pattern
nnoremap <BACKSPACE> :noh<CR>

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
let g:vimwiki_list = [{'path': '~/.notes', 'path_html': '~/.notes/html'}]

" Map :Files to CTRL-P
nnoremap <C-p> :Files<Cr>
