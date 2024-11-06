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

" vim-tmux-navigator
" automatically rebalance windows on resize
autocmd VimResized * :wincmd =

" emmet-vim
let g:user_emmet_settings = { 'typescript' : { 'extends' : 'jsx' } }
