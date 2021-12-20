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
map <Leader>f :GFiles<Cr>
map <Leader>F :Files<Cr>
map <Leader>b :Buffers<Cr>
map <Leader>g :Rg <C-r><C-w><Cr>
map <Leader>G :Rg<Cr>
map <Leader>t :Tags<Cr>


" requires vim-eunuch
cmap w!! SudoWrite
" Things I picked up from this talk: https://www.youtube.com/watch?v=434tljD-5C8
map gf :edit <cfile><cr>

nmap <silent> <leader>ve :edit $MYVIMRC<cr>
nmap <silent> <leader>vs :source $MYVIMRC<cr>

" https://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

nnoremap n nzz
nnoremap N Nzz
nnoremap J mzJ`z
