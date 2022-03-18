"     == == ==
" vim-airline configs
"     == == ==

" Draw Powerline fonts in airline
" ... why is this disabled by default?
let g:airline_powerline_fonts = 1

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 0

" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]

" Customize vim airline per filetype
" 'nerdtree'  - Hide nerdtree status line
" 'list'      - Only show file type plus current line number out of total
let g:airline_filetype_overrides = {
  \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', ''), '' ],
  \ 'list': [ '%y', '%l/%L'],
  \ }
" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])
let g:airline_section_c = airline#section#create(['fileencoding','fileformat','readonly'])

" Use the minimalist theme to not let eyes be blasted by colors
let g:airline_theme = 'minimalist'

let g:airline#extensions#whitespace#enabled = 0

let g:airline_mode_map = {
      \ '__'     : '-',
      \ 'c'      : ':',
      \ 'i'      : 'I',
      \ 'ic'     : 'I',
      \ 'ix'     : 'I',
      \ 'n'      : ' ',
      \ 'multi'  : 'M',
      \ 'ni'     : 'N',
      \ 'no'     : 'N',
      \ 'R'      : 'R',
      \ 'Rv'     : 'R',
      \ 's'      : 'S',
      \ 'S'      : 'S',
      \ ''     : 'S',
      \ 't'      : 'T',
      \ 'v'      : 'V',
      \ 'V'      : 'V',
      \ ''     : 'V',
      \ }

" Custom separators for airline
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" Characters taken straight from Spaceline src
" https://github.com/glepnir/spaceline.vim/blob/master/autoload/spaceline/seperator.vim
" let g:airline_left_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_alt_sep = '|'


