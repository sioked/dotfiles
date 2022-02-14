local lsp_installer = require('nvim-lsp-installer')
lsp_installer.on_server_ready(function(server)
  local opts = {}
  if server.name == "eslint" then
    opts.on_attach = function (client, bufnr)
      -- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
      -- the resolved capabilities of the eslint server ourselves!
      client.resolved_capabilities.document_formatting = true
    end
    opts.settings = {
      format = { enable = true }, -- this will enable formatting
    }
  end
  server:setup(opts)
end)
