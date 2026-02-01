vim.keymap.set('n', '<C-f>', ':Telescope find_files<cr>', {noremap=true, silent=true})
vim.keymap.set('n', '<leader>tg', ':Telescope live_grep<cr>', {noremap=true, silent=true})
vim.keymap.set('n', '<leader>tb', ':Telescope buffers<cr>', {noremap=true, silent=true})
vim.keymap.set('n', '<leader>th', ':Telescope help_tags<cr>', {noremap=true, silent=true})

vim.keymap.set('n', '<leader>oi', ':Oil<cr>', {noremap=true, silent=true})

vim.keymap.set('n', '<leader>tt', ':TTab<cr>')

vim.keymap.set('n', '<leader>qq', ':q<cr>')

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  end,
})

vim.keymap.set('n', '<leader>bd', ':bp<cr>:bd #<cr>')

