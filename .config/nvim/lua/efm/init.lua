local lspconfig = require('lspconfig')
local map = require('utils').map
local prettier = require('efm.prettier')
local eslint = require('efm.eslint')

lspconfig.efm.setup {
  init_options = {documentFormatting = true},
  -- root_dir = vim.loop.cwd,
  settings = {
    rootMarkers = {".git/"},
    languages = {
      typescript = {prettier, eslint},
      javascript = {prettier, eslint},
      typescriptreact = {prettier, eslint},
      javascriptreact = {prettier, eslint},
      yaml = {prettier},
      json = {prettier},
      html = {prettier},
      scss = {prettier},
      css = {prettier},
      markdown = {prettier},
    },
  },
}
