set termguicolors
colors nord
let g:nord_cursor_line_number_background = 1
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1

" open splits more naturally
set splitright
set splitbelow

" show line numbers
set number
set relativenumber

" turn off relativenumber in insert mode
augroup every
  autocmd!
  au InsertEnter * set norelativenumber
  au InsertLeave * set relativenumber
augroup END

" highlight current line
set cursorline

" Use ripgrep as grep prog
set grepprg=rg\ -S\ --vimgrep\ --no-heading
set grepformat^=%f:%l:%c:%m

set hidden

set ignorecase
set smartcase
set incsearch

autocmd TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
