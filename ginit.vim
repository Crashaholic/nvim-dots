" This init file is for the Qt version of Neovim
" Decided to get nvim on my PC and will be sticking with the Qt version
" It has click detection + functionality, which is almost the same as
" how it acts on Termux. So I'm more used to it
" Even so, I have no idea how to get NodeJS up and running on my PC
" So I'm just gonna have it here as a... uh... commodity?
" 
" I dunno.

" For Right click functionality
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>

" 2026 update: majority of the lines below here were already part of
" ./lua/config/options.lua
" No need to repeat what's already there so...

