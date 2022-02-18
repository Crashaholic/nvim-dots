# Crash's init.vim

This Neovim config is intended for C++ development.

I use Neovim on my phone via Termux, which allows me to write code on the go when I am away from my PC (which is slowly becoming more and more often). However, it is not really intended for building since I still am learning how some of these tools work, especially [ccls](https://github.com/MaskRay/ccls).

I am considering shifting to Android development, also with Termux and utilizing [BuildAPKs](https://github.com/BuildAPKs/buildAPKs), which means that this config might soon work for both Java and C++. Exciting.

## Plugins
_**Note that this list could be out-of-date. Its hard to maintain this list when the plugins on here is ever-changing.**_

| Plugin name | Purpose | Notes |
|--|--|--|
| [vim-airline](https://github.com/vim-airline/vim-airline)| Pretties up the status line | Separators got changed to slanted style characters |
| [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes) | Choosing of Airline's colors | Set to 'minimalist' |
| [CoC](https://github.com/neoclide/coc.nvim)| Completion and LSP client |--|
|[vim-lsp-cxx-highlight](https://github.com/jackguo380/vim-lsp-cxx-highlight)|LSP-based highlighting|--|
| [NERDTree](https://github.com/preservim/nerdtree)| Navigation | Much less used ever since Telescope was introduced to my set up |
| [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)|Navigation|\<leader>tf and \<leader>tb is now my often-pressed keystroke|
| [auto-pairs](https://github.com/jiangmiao/auto-pairs)|Auto closing of quotes and braces |--|
| [vim-tags](https://github.com/szw/vim-tags)|Tag generation|--|
| [Tagbar](https://github.com/preservim/tagbar)|Tag navigation|--|
| [vim-fugitive](https://github.com/tpope/vim-fugitive)   |Git integration|--|
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim)|Buffer navigation|--|
| [vim-tasklist](https://github.com/chauncey-garrett/vim-tasklist)   |TODO list navigation|Left TODOs everywhere and couldnt find them, so I got this plugin to find them. USED `Plug 'chauncey-garrett/vim-tasklist'` TO INSTALL.|

