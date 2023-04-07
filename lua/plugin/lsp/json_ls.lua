-- https://github.com/vscode-langservers/vscode-json-languageserver
require('lspconfig').jsonls.setup {
  on_attach = require('plugin.lsp').on_attach,
  settings = {
    json = {
      schemas = {
        { fileMatch = { 'jsconfig.json' }, url = 'https://json.schemastore.org/jsconfig' },
        { fileMatch = { 'tsconfig.json' }, url = 'https://json.schemastore.org/tsconfig' },
        { fileMatch = { 'package.json' }, url = 'https://json.schemastore.org/package' },
      },
    },
  },
  capabilities = require('plugin.lsp').capabilities,
}
