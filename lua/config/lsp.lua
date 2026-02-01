-- Add the same capabilities to ALL server configurations.
-- Refer to :h vim.lsp.config() for more information.
-- vim.lsp.config("*", {
--   capabilities = vim.lsp.protocol.make_client_capabilities()
-- })
vim.lsp.config("*", {
  capabilities = {
    textDocument = {
      semanticTokens = {
        multilineTokenSupport = true,
      },
    },
  },
  root_markers = { ".git" },
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--   end,
-- })

