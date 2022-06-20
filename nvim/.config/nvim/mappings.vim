" map leader to SPACE
let mapleader = " "

" mappings to make my life easier
nnoremap Y y$
nnoremap H ^
onoremap H ^
vnoremap H ^
nnoremap Q @@

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

" fzf mappings
map <Leader>f :GFiles!<Cr>
map <Leader>F :Files!<Cr>
map <Leader>b :Buffers!<Cr>
map <Leader>/ :Rg!<Cr>
map <Leader>t :Tags!<Cr>
map <Leader>c :BCommits!<Cr>
map <Leader>C :Commits!<Cr>

map <Leader>gs :tab :Git<Cr>
map <Leader>gl :tab :Git log<Cr>

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
