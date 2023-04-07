require('lspconfig').sqlls.setup{
    on_attach = require('plugin.lsp').on_attach,
    capabilites = require('plugin.lsp').capabilities
}
