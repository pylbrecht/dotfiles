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
Plugin 'jiangmiao/auto-pairs'
"Plugin 'scrooloose/syntastic'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'nvie/vim-flake8'
Plugin 'chriskempson/base16-vim'
Plugin 'majutsushi/tagbar'
Plugin 'jnurmine/Zenburn'
Plugin 'ChrisKempson/Tomorrow-Theme'
Plugin 'altercation/vim-colors-solarized'
Plugin 'dracula/vim'
" > snippet related
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
" < snippet related
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'

" all of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" set font for gVim
if has("win32")
    "set guifont=Consolas:h12
    set guifont=Source\ Code\ Pro\ Medium:h11
	"set guifont=Inconsolata:h12
elseif has("unix")
	set guifont=DejaVu\ Sans\ Mono:h11
endif

" remove tool-, menu- and scrollbar
set guioptions-=m
set guioptions-=T
set guioptions-=L

" remove trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

" backspace
set backspace=indent,eol,start

" clear last search pattern
nnoremap <BACKSPACE> :noh<CR>

" rebind <Leader> key to space
let mapleader = "\<SPACE>"

" highlight current line
set cursorline

" show line numbers
set number

" tab motion
map <Leader>h <esc>:tabprevious<CR>
map <Leader>l <esc>:tabnext<CR>
map <Leader>t <esc>:tabnew<CR>
map <Leader>q <esc>:tabclose<CR>

" split motion
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" map sort function
vnoremap <Leader>s :sort<CR>

" easier moving code blocks
vnoremap < <gv
vnoremap > >gv

" colorscheme
set t_Co=256
set background=dark
let g:gruvbox_italic=1
colors gruvbox

" syntax highlighting
syntax on
filetype indent plugin on

" window size
set lines=80
set columns=200

" indentation
set tabstop=4
set shiftwidth=4
set expandtab

" visually highlight at 81
highlight ColorColumn ctermbg=magenta guibg=#fb4934
call matchadd('ColorColumn', '\%81v', 100)

" search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" vimwiki
let g:vimwiki_list = [{'path': '~/notes', 'path_html': '~/notes/html'}]

" tagbar
nmap <F8> :TagbarToggle<CR>

let g:airline_powerline_fonts = 1

" Open vertical splits on the right side
set splitright

"""""""""""""""""""""""
"       Plugins       "
"""""""""""""""""""""""

" Open already open file in new pane instead of switching to it.
let g:ctrlp_switch_buffer = 'et'

" YouCompleteMe
set encoding=utf-8
