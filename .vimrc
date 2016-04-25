"automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

if has('gui')
  set go-=T "remove icons
endif

"remove trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

"better copy & paste
set clipboard=unnamed

"backspace
set backspace=indent,eol,start

"highlight current line
set cursorline

"cursor color
set guicursor=n-v-c:block-Cursor

"rebind <Leader> key
let mapleader=","

"clear last search pattern
nnoremap <BACKSPACE> :noh<CR>

"tab manipulation
map <Leader>d <esc>:tabprevious<CR>
map <Leader>f <esc>:tabnext<CR>
map <Leader>t <esc>:tabnew<CR>

"list navigation
map <Leader>s :lne<CR>
map <Leader>a :lpr<CR>

"split window navigation
nnoremap <Leader>j <C-W><C-J>
nnoremap <Leader>k <C-W><C-K>
nnoremap <Leader>h <C-W><C-H>
nnoremap <Leader>l <C-W><C-L>

"map sort function to a key
vnoremap <Leader>s :sort<CR>

"easier moving code blocks
vnoremap < <gv
vnoremap > >gv

set background=dark
colors solarized

"syntax highlighting
syntax on
filetype indent plugin on

"line numbers & length
set number
set tw=79
set nowrap
set fo-=t

"indentation
set tabstop=4
set shiftwidth=4
set noexpandtab

"visually highlight at 80 & 120 characters
let &colorcolumn="80,".join(range(120,999),",")

"set paren color
highlight MatchParen cterm=bold ctermbg=none ctermfg=yellow

"useful settings
set history=700
set undolevels=700


"search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"pathogen
execute pathogen#infect()

"NERDtree
"
" set toggle key
map <Leader>m :NERDTreeToggle<CR>

let g:powerline_pycmd = "py3"

" rust autoformat
let g:rustfmt_autosave = 1
