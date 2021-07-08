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
map <Leader><Leader>f :Files<Cr>
map <Leader>b :Buffers<Cr>
map <Leader>g :Rg<Cr>
map <Leader>l :Lines<Cr>
map <Leader>t :Tags<Cr>

" ale mappings
map <Leader>d :ALEGoToDefinition<CR>
map <Leader>r :ALEFindReferences<CR>
