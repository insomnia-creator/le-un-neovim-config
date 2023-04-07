local is_npm_package_installed = require('npm')

local have_tailwindish_styling = is_npm_package_installed 'tailwindcss'
if have_tailwindish_styling then
  require('lspconfig').tailwindcss.setup {
    on_attach = require('plugin.lsp').on_attach,
    capabilities = require('plugin.lsp').capabilities,
    settings = {
      tailwindCSS = {
        classAttributes = {
          'class',
          'className',
          'classList',
          'enterActiveClass',
          'exitActiveClass',
          'enterClass',
          'exitToClass',
        },
      },
    },
  }
end
