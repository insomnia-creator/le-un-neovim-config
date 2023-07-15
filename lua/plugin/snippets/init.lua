local ls = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load({paths = {"./flutter.json"}});
require'luasnip'.filetype_extend('vue', {'vue'})

require 'plugin.snippets.vue'
