" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible
set hidden

call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets' | Plug 'mlaursen/vim-react-snippets'
Plug 'arcticicestudio/nord-vim'
Plug 'dense-analysis/ale'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'mattn/calendar-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vimwiki/vimwiki'
Plug 'yuezk/vim-js'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

call plug#end()

filetype plugin indent on

" gVim related settings
if has('gui_running')
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar
    set guifont=SauceCodePro\ Nerd\ Font\ Medium\ 12
endif

" auto-wrap long lines for markdown files
augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap
augroup END

" open splits more naturally
set splitright
set splitbelow

" set backup/swap dir
set backupdir=~/.vim/backup
set directory=~/.vim/swap

" copy everything to system's clipboard
set clipboard=unnamed

" map leader to SPACE
let mapleader = " "

" remap yank inconsistency
nnoremap Y y$

" backspace
set backspace=indent,eol,start

" encoding
set encoding=utf-8

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

" keep 5 lines on top/bottom while scrolling
set scrolloff=5

" colorscheme
set t_Co=256
set background=dark
let g:gruvbox_italic=0
colors nord

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
let wiki_default = {
	\ 'path': '~/notes/default',
    \ 'auto_tags': 1,
	\ 'template_path': '~/.config/vimwiki/templates',
	\ 'template_default': 'default',
	\ 'syntax': 'markdown',
	\ 'ext': '.md',
	\ 'path_html': '~/notes/default/html/',
	\ 'custom_wiki2html': 'vimwiki_markdown',
    \ 'html_filename_parameterization': 1,
	\ 'template_ext': '.html'}

let wiki_investigations = {
    \ 'path': '~/notes/investigations',
    \ 'auto_tags': 1,
	\ 'template_path': '~/.config/vimwiki/templates',
	\ 'template_default': 'default',
	\ 'syntax': 'markdown',
	\ 'ext': '.md',
	\ 'path_html': '~/notes/investigations/html/',
	\ 'custom_wiki2html': 'vimwiki_markdown',
    \ 'html_filename_parameterization': 1,
	\ 'template_ext': '.html'}

let g:vimwiki_list = [wiki_default, wiki_investigations]

" fzf mappings
map <Leader>f :GFiles<Cr>
map <Leader><Leader>f :Files<Cr>
map <Leader>b :Buffers<Cr>
map <Leader>g :Rg<Cr>
map <Leader>l :Lines<Cr>

" Use ripgrep as grep prog
set grepprg=rg\ -S\ --vimgrep
set grepformat^=%f:%l:%c:%m

" nord theme
let g:nord_cursor_line_number_background = 1
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

" vim-airline
let g:airline#extensions#cursormode#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" disable hunks/branch
let g:airline_section_b = ''
let g:airline_section_y = ''

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''

" startify
let g:startify_change_to_dir = 0

" ALE
let g:airline#extensions#ale#enabled = 1
let g:ale_completion_enabled = 1

let g:ale_python_pyls_config = {
      \   'pyls': {
      \     'plugins': {
      \       'pycodestyle': {
      \         'enabled': v:false
      \       }
      \     }
      \   },
      \ }
let g:ale_python_flake8_options = '--ignore=Q000'
let g:ale_python_bandit_options = '--skip B101'
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
map <Leader>d :ALEGoToDefinition<CR>
map <Leader>r :ALEFindReferences<CR>

" snippets
let g:UltiSnipsExpandTrigger="<C-l>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
