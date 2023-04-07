require 'lspconfig'.rust_analyzer.setup {
    on_attach = require('plugin.lsp').on_attach,
    capabilities = require'plugin.lsp'.capabilities,
    settings = {
         ["rust-analyzer"] = {
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
             checkOnSave = {
              command = "clippy",
            },
        }
    }
}
