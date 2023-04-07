-- https://github.com/sumneko/lua-language-server
-- https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)


require('lspconfig').lua_ls.setup {
  on_attach = require('plugin.lsp').on_attach,
  capabilities = require('plugin.lsp').capabilities,
  settings = {
    Lua = {
      format = {
        enable = false,
      },
    },
  },
}
