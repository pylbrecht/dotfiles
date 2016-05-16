set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
if has("win32")
	set rtp+=$HOME/vimfiles/bundle/Vundle.vim
	call vundle#begin('$HOME/vimfiles/bundle')
elseif has("unix")
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin('~/.vim/bundle')
endif

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'rust-lang/rust.vim'

" Fix for Vundle not loading all plugins
"call vundle#config#require(g:bundles)

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Set font
if has("win32")
	set guifont=Consolas:h11
elseif has("unix")
	set guifont=DejaVu\ Sans\ Mono:h11
endif

" Remove tool-, menu- and scrollbars
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

"remove trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

"backspace
set backspace=indent,eol,start

"clear last search pattern
nnoremap <BACKSPACE> :noh<CR>

"rebind <Leader> key
let mapleader=","

"highlight current line
set cursorline

"show line numbers
set number

"tab manipulation
map <Leader>d <esc>:tabprevious<CR>
map <Leader>f <esc>:tabnext<CR>
map <Leader>t <esc>:tabnew<CR>

"map sort function to a key
vnoremap <Leader>s :sort<CR>

"easier moving code blocks
vnoremap < <gv
vnoremap > >gv

"colorscheme
set background=dark
colors solarized

"syntax highlighting
syntax on
filetype indent plugin on

"window size
set lines=80
set columns=200

"indentation
set tabstop=4
set shiftwidth=4
set noexpandtab

"visually highlight at 80 & 120 characters
let &colorcolumn="80,".join(range(120,999),",")

"search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

"NERDtree
"set toggle key
map <Leader>m :NERDTreeToggle<CR>

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
