require('mason').setup()

require('mason-lspconfig').setup({
  ensure_installed = { 'ts_ls', 'eslint' },
})

-- ts_ls: TypeScript / JavaScript
vim.lsp.config('ts_ls', {})
vim.lsp.enable('ts_ls')

-- eslint: linting + formatting
vim.lsp.config('eslint', {
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = true
  end,
  settings = {
    format = { enable = true },
  },
})
vim.lsp.enable('eslint')
