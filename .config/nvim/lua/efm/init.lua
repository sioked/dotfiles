local lspconfig = require('lspconfig')
local map = require('utils').map
local prettier = require('efm.prettier')

lspconfig.efm.setup {
  init_options = {documentFormatting = true},
  root_dir = vim.loop.cwd,
  filetypes = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'css', 'scss', 'markdown', 'html', 'json', 'yaml' },
  settings = {
    rootMarkers = {".git/"},
    languages = {
      typescript = {prettier},
      javascript = {prettier},
      typescriptreact = {prettier},
      javascriptreact = {prettier},
      yaml = {prettier},
      json = {prettier},
      html = {prettier},
      scss = {prettier},
      css = {prettier},
      markdown = {prettier},
    },
  },
}
