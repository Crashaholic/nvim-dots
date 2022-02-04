" === === === === === ===
" |     Plugins here    |
" === === === === === ===

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Removed fzf because Telescope has a much better
" out-of-the-box experience
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'pangloss/vim-javascript'
Plug 'artur-shaik/vim-javacomplete2'

Plug 'jiangmiao/auto-pairs'

Plug 'BurntSushi/ripgrep'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()



"     == == ==
" Vim Configurations
"     == == ==

set encoding=UTF-8

set tabstop=4
set noexpandtab
set shiftwidth=4

set number

set whichwrap+=<,>,[,]



"     == == ==
" vim-airline configs
"     == == ==

" Draw Powerline fonts in airline
" ... why is this disabled by default?
let g:airline_powerline_fonts = 1

" Adds a tabline at the top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

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



"  == == ==
"  NERDTree
"  == == ==

nnoremap <F4>   :NERDTree <CR>
nnoremap <A-w>  :NERDTreeToggle <CR>
nnoremap <A-e>  :NERDTreeFocus <CR>

" Start NERDTree when Vim is started without file arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" let NERDTreeMapOpenInTab='<ENTER>'

nnoremap <leader>q :bp<cr>:bd #<cr>



" == == ==
"    CoC
" == == ==

function! s:show_documentation() 
	if (index(['vim','help'], &filetype) >= 0) 
		execute 'h '.expand('<cword>') 
	elseif (coc#rpc#ready()) 
		call CocActionAsync('doHover') 
	else 
		execute '!' . &keywordprg . " " . expand('<cword>') 
	endif 
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use tab for trigger completion with characters ahead and navigate. 
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by 
" other plugin before putting this into your config. 
inoremap <silent><expr> <TAB> 
			\ pumvisible() ? "\<C-n>" : 
			\ <SID>check_back_space() ? "\<TAB>" : 
			\ coc#refresh() 
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>" 

function! s:check_back_space() abort 
	let col = col('.') - 1 
	return !col || getline('.')[col - 1] =~# '\s' 
endfunction 

" Make <CR> auto-select the first completion item and notify coc.nvim to 
" format on enter, <cr> could be remapped by other vim plugin 
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() 
							\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>" 


" Symbol renaming. 
nmap <silent> rn <Plug>(coc-rename) 



" == == ==
" Telescope
" == == ==

" Find files using Telescope command-line sugar.
nnoremap <silent> ff :Telescope find_files<cr>
nnoremap <silent> fg :Telescope live_grep<cr>
nnoremap <silent> fb :Telescope buffers<cr>
nnoremap <silent> fh :Telescope help_tags<cr>



"      == == ==
" JavaComplete configs
"      == == ==

autocmd FileType java setlocal omnifunc=javacomplete#Complete
"nmap <C-J> <Plug>(JavaComplete-Imports-AddMissing)
"imap <F6> <Plug>(JavaComplete-Imports-AddMissing)

" let g:JavaComplete_EnableDefaultMappings = 1


"  == == ==
" QoL mappings
"  == == ==

" Save files using Control-S
nnoremap <c-s> :w <CR>
inoremap <c-s> <Esc> :w <CR>

" Quit program quickly
nnoremap <silent> ee :wq <CR>
nnoremap <silent> ex :q! <CR>
