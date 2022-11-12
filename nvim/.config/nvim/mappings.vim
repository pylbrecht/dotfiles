" map leader to SPACE
let mapleader = " "

" mappings to make my life easier
nnoremap Y y$
nnoremap H ^
onoremap H ^
vnoremap H ^
nnoremap Q @@
cnoreabbrev Q q
cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev Qa qa

" yank current buffer's file name to system clipboard
nnoremap <Leader>yf :let @+ = expand("%")<Cr>
vnoremap <Leader>j :!jq<cr>
nnoremap <Leader>j :%!jq<cr>

" Stolen from https://www.destroyallsoftware.com/screencasts/catalog/file-navigation-in-vim
cnoremap %% <C-R>=expand('%:h').'/'<cr>

command! Vimrc :vs $MYVIMRC

" clear last search pattern
nnoremap <BACKSPACE> :noh<CR>

" split motion
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" easier moving code blocks
vnoremap < <gv
vnoremap > >gv

" telescope mappings
map <Leader>f :Telescope git_files<Cr>
map <Leader>F :Telescope find_files<Cr>
map <Leader>b :Telescope buffers<Cr>
map <Leader>/ :Telescope live_grep<Cr>
map <Leader>g :Telescope grep_string<Cr>
map <Leader>t :Telescope tags<Cr>
nnoremap gr :Telescope lsp_references<Cr>
nnoremap gd :Telescope lsp_definitions<Cr>
nnoremap q: :Telescope command_history<Cr>
nnoremap q/ :Telescope search_history<Cr>

nnoremap <Leader>o :ToggleOnly<cr>

" Things I picked up from this talk: https://www.youtube.com/watch?v=434tljD-5C8
map gf :edit <cfile><cr>

" https://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap <expr>y "my\"" . v:register . "y`y"
vnoremap Y myY`y

nnoremap n nzz
nnoremap N Nzz
nnoremap J mzJ`z

" inspired by https://www.reddit.com/r/vim/comments/uatzky/my_favorite_way_to_leave_insert_mode/i60y33b/
nnoremap <silent> zd :bd!<cr>
nnoremap <silent> zq :bufdo! bd!<cr>
nnoremap <Leader><Leader>ft :set ft=
nnoremap <Leader><Leader>w :w<cr>
nnoremap <Leader><Leader>co :copen<cr>
nnoremap <Leader><Leader>cq :cclose<cr>

" vim-test
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
