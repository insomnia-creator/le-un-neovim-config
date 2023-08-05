local actions = require 'telescope.actions'
local builtin = require 'telescope.builtin'    
local map = require('plugin.maps').map
map('n', '<leader>sf', builtin.find_files)
map('n', '<leader>sg', builtin.live_grep)

require('telescope').setup {
    defaults = {
        prompt_prefix = '   ',
        selection_caret = '  ',
        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ['<CR>'] = actions.file_tab,
                ['<c-j>'] = actions.move_selection_next,
                ['<c-k>'] = actions.move_selection_previous,

                ['<s-up>'] = actions.cycle_history_prev,
                ['<s-down>'] = actions.cycle_history_next,

                ['<C-w>'] = function()
                    vim.api.nvim_input '<c-s-w>'
                end
            }
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case'
        },
    },
    pickers = {
        oldfiles = {
            sort_lastused = true,
            cwd_only = true
        },
        find_files = {
            hidden =false,
            find_command = {'rg', '--files', vim.fn.getcwd() , '--color', 'never'}
        }
    }
}

require('telescope').load_extension 'notify'
require('telescope').load_extension 'lazygit'
