vim.o.completeopt = 'menuone,noselect'
local cmp = require 'cmp'
local icons = {
    Text = ' ',
    Method = ' ',
    Function = ' ',
    Constructor = ' ',
    Field = ' ',
    Variable = ' ',
    Class = ' ',
    Interface = ' ',
    Module = ' ',
    Property = ' ',
    Unit = ' ',
    Value = ' ',
    Enum = ' ',
    Keyword = ' ',
    Snippet = ' ',
    Color = ' ',
    File = ' ',
    Reference = ' ',
    Folder = ' ',
    EnumMember = ' ',
    Constant = ' ',
    Struct = ' ',
    Event = ' ',
    Operator = ' ',
    TypeParameter = ' ',
  }
  
cmp.setup({
    completion = {
        -- completeopt = 'menu,menuone,noinsert',
    },
    formatting = {
        format = function(entry, vim_item)
            local kind = string.format('%s %s', icons[vim_item.kind], vim_item.kind)

            -- Move the icon to be on the left side
            local strings = vim.split(kind, '%s', { trimempty = true })
            vim_item.kind = ' ' .. strings[1] .. ' '
      
            if vim_item.menu and #vim_item.menu > 25 then
              local first_slash = string.find(vim_item.menu, '/')
              local last_slash = string.find(vim_item.menu, '/[^/]*$')
      
              vim_item.menu = string.sub(vim_item.menu, 1, first_slash) .. '…' .. string.sub(vim_item.menu, last_slash)
            end
      
            return vim_item
        end
    },
    sources = {
        {name = 'nvim_lsp'}, {name = 'nvim_lua'}, {name = 'path'},
        {name = 'calc'}
    },
    experimental = {
        -- ghost_text = true,
    }

})

-- Require function for tab to work with LUA-SNIP
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and
               vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col,
                                                                          col)
                   :match("%s") == nil
end

cmp.setup({
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        }),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {"i", "s"}),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, {"i", "s"})

    }
})
