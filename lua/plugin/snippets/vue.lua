local ls = require('luasnip')
---shorthands
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

ls.add_snippets('vue', {
  s('comp', {
    t({"<template>", "\t"}),
    t({"\t", "</template>" }),
    t({"\t", "<script "}),
    c(1, {
      t('setup lang="ts">'),
      t("setup>"),
      t('lang="ts">'),
      t('>')
    }),
    t({"\t", "</script>"})
  })
})
