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
nnoremap <silent> rn <Plug>(coc-rename) 



" == == ==
" echodoc configs
" == == ==

" Or, you could use neovim's floating text feature.
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'floating'



" == trouble.nvim ==

lua << EOF
require("trouble").setup {
		
}
EOF
