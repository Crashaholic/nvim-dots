# Crash's init.lua
## Update: 31/01/2026
Say "Hello" to my yearly update, I guess. I dunno, I just get that itch to update my Neovim config from time to time.

This commit brings about actual LSP integration, as the Neovim version required is bumped up to `v0.11.5` to take advantage of the built-in LSP capabilities. 

I also don't really know what I want out of this newer config besides trying to get it more inline with how other people have their configs. As such, it's pretty generalized, I guess. 

I still haven't learned how to use Vim/Neovim's motions and such, still just pressing arrow keys for each line, for each character. Yes, it's painful, and I want to correct that. Some other time though, no rush.

Uhh, lessee... ah yeah, as mentioned above, most of the plugins in use now are more like what you'd see in a typical(-ish) Neovim config (I hope?). So there's `treesitter`, `mason`, `blink` for completion, experimenting with `oil`, so on and so forth.

And uhh, the original README doesn't really have to be preserved since I *am* using Github.

For clipboard shenanigans, I prefer to just be able to paste straight from my system.
```
sudo apt install xclip
```

Also, in case of C++ development, ***MAKE SURE `libstdc++-12-dev` IS INSTALLED clangd DOES NOT HAVE ACCESS TO g++ HEADERS BECAUSE YES***

## Update: 11/02/2025
Wow. I barely even use Neovim anymore.

This newer commit tries to refresh some of the stuff used in the original config.

The configs have also been adapted to use Lua instead of Vimscript, given that it seems to be the more widely adopted approach these days. There may be some carelessness during the adaptation and caused some of the key mapping to be omitted.

I did consider trying to get out of using CoC, however, the convenience that CoC brings is just too powerful, and absolutely saves the hassle of having to go around, finding the right LSP tools that I would lose from replacing CoC.

As much as I wanted to shift to using my own LSP set of plugins, I just do not want to spend the time to do it. So CoC it is...

To get CCLS working, based on my current WSL2 setup:
```
sudo snap install ccls --classic
```

---

I use Neovim on my phone via Termux, which allows me to write code on the go when I am away from my PC. 

I am considering shifting to Android development, with Termux and utilizing [BuildAPKs](https://github.com/BuildAPKs/buildAPKs), which means that this config might soon work for both Java and C++. Exciting.

# Plugins

| Plugin name | What is this for? | Notes |
|--|--|--|
| [blink.cmp]("https://github.com/saghen/blink.cmp")|Completion engine|--|
| [catppuccin]("https://github.com/catppuccin/nvim")|Catppuccin colors, something new|--|
| [nvim-colorizer.lua]("https://github.com/norcalli/nvim-colorizer.lua")|Colorizer for HTML colors, when needed|--|
| [Comment.nvim]("https://github.com/numToStr/Comment.nvim")|Quick commenting|--|
| [gentags.lua]("https://github.com/JMarkin/gentags.lua")|Automatic tag generation|--|
| [gitsigns.nvim]("https://github.com/lewis6991/gitsigns.nvim")|Git blame|Hasn't seemed to work for me :/|
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)| Pretties up the status line | -- |
| [luasnip]("https://github.com/L3MON4D3/LuaSnip")|Snippet engine|--|
| [mason.nvim]("https://github.com/mason-org/mason.nvim")|Get LSPs in a pinch|--|
| [mason-lspconfig.nvim]("https://github.com/williamboman/mason-lspconfig.nvim")|Bridge the LSPs to the configs|--|
| [nvim-autopairs]("https://github.com/windwp/nvim-autopairs")|Auto brace|--|
| [nvim-lspconfig]("https://github.com/neovim/nvim-lspconfig")|Redundant it looks like?|Grabbed it just in case|
| [oil.nvim]("https://github.com/stevearc/oil.nvim")|File navigation|`\<leader\>oi`|
| [oil-git.nvim]("https://github.com/benomahony/oil-git.nvim")|Show file status on oil.nvim|--|
| [todo-comments.nvim]("https://github.com/folke/todo-comments.nvim")|TODO getter|--|
| [nvim-treesitter]("https://github.com/nvim-treesitter/nvim-treesitter")|Fast syntax highlighting (I think?)|--|
| [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)|Navigation|`C-f` all the way|
| [Trouble.nvim]("https://github.com/folke/trouble.nvim")|Diagnostics jump|--|
| [which-key.nvim]("https://github.com/folke/which-key.nvim")|See what keystrokes does what|--|
| [vim-fugitive](https://github.com/tpope/vim-fugitive) |Git integration|--|

# Keybindings

|Mode|Keybind|Action|
|--|--|--|
|Normal|\<leader\>bd|Close Buffer|
|Insert|\<C-Space\>|Trigger Completion|
|Normal|K|Show Documentation|
|Insert|\<C-y\>|Trigger Completion|
|Insert|\<C-n\>|Cycle Next Completion|
|Insert|\<C-p\>|Cycle Prev Completion|
|Normal|\<C-f\>|Find File \[Telescope\]|
|Normal|\<leader\>tg|Live Grep \[Telescope\]|
|Normal|\<leader\>tb|Buffers \[Telescope\]|
|Normal|\<leader\>th|Help Tags \[Telescope\]|
|Normal|\<leader\>tt|Toggle between 2 and 4 tab spaces|

