require('lspconfig').denols.setup {
  on_attach = require('plugin.lsp').on_attach,
  capabilities = require('plugin.lsp').capabilities,
  init_options = {
    lint = true
  },
  root_dir = require('lspconfig.util').root_pattern 'deno.json'
}
