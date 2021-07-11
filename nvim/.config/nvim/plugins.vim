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
