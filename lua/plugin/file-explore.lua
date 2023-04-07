local lir = require 'lir'
local actions = require 'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require 'lir.clipboard.actions'
local Path = require 'plenary.path'

local buf_map = require('plugin.maps').buf_map

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local lcd = function(path)
  vim.cmd(string.format([[silent execute (haslocaldir() ? 'lcd' : 'cd') '%s']], path))
end

-- A smarter function to create a new file or folder
local function new_file()
  -- Temporarily CD into the currently active directory so that completion
  -- works nicely
  local save_curdir = vim.fn.getcwd()
  lcd(lir.get_context().dir)
  local name = vim.fn.input('New file: ', '', 'file')
  lcd(save_curdir)

  if name == '' then
    return
  end

  local is_folder = string.match(name, '/$')

  local path = Path:new(lir.get_context().dir .. name)
  if is_folder then
    -- Create a new directory
    name = name:gsub('/$', '')
    path:mkdir {
      parents = true,
      mode = tonumber('700', 8),
      exists_ok = false,
    }

    actions.reload()

    -- Jump to a line in the parent directory of the file you created.
    local lnum = lir.get_context():indexof(name:match '^[^/]+')
    if lnum then
      vim.cmd(tostring(lnum))
    end
  else
    -- Create a new file
    path:touch {
      parents = true,
      mode = tonumber('644', 8),
    }
    actions.quit()
    vim.cmd.e(path:expand())
  end
end

local function new_file_tab()
  -- Temporarily CD into the currently active directory so that completion
  -- works nicely
  local save_curdir = vim.fn.getcwd()
  lcd(lir.get_context().dir)
  local name = vim.fn.input('New file: ', '', 'file')
  lcd(save_curdir)

  if name == '' then
    return
  end

  local is_folder = string.match(name, '/$')

  local path = Path:new(lir.get_context().dir .. name)
  if is_folder then
    -- Create a new directory
    name = name:gsub('/$', '')
    path:mkdir {
      parents = true,
      mode = tonumber('700', 8),
      exists_ok = false,
    }

    actions.reload()

    -- Jump to a line in the parent directory of the file you created.
    local lnum = lir.get_context():indexof(name:match '^[^/]+')
    if lnum then
      vim.cmd(tostring(lnum))
    end
  else
    -- Create a new file
    path:touch {
      parents = true,
      mode = tonumber('644', 8),
    }
    actions.quit()
    vim.cmd(string.format('tabnew %s', path:expand()))
  end
end

require('lir').setup {
  show_hidden_files = true,
  devicons = {
    enable = true
  },
  mappings = {
    ['<cr>'] = function(quit_lir)
        actions.edit(quit_lir)
    end,
    ['<C-x>'] = actions.split,
    ['<C-v>'] = actions.vsplit,
    ['<S-CR>'] = actions.tabedit,
    ['<esc>'] = actions.quit,
    ['<tab>'] = actions.up,
    ['q'] = actions.quit,

    ['N'] = new_file,
    ['n'] = new_file_tab,
    ['r'] = actions.rename,
    ['@'] = actions.cd,
    ['y'] = actions.yank_path,
    ['.'] = actions.toggle_show_hidden,
    ['d'] = actions.delete,
    ['J'] = function()
      mark_actions.toggle_mark()
      vim.cmd.normal { 'j', bang = true }
    end,
    ['C'] = clipboard_actions.copy,
    ['X'] = clipboard_actions.cut,
    ['P'] = clipboard_actions.paste,

    -- Go to Git root
    ['H'] = function()
      local dir = require('lspconfig.util').find_git_ancestor(vim.fn.getcwd())
      if dir == nil or dir == '' then
        return
      end
      vim.cmd.e(dir)
    end,
  },
  float = {
    winblend = 0,
    
  },
  hide_cursor = true,
}

local group = vim.api.nvim_create_augroup('LirSettings', {})
vim.api.nvim_create_autocmd('FileType', {
  group = group,
  pattern = 'lir',
  callback = function()
    buf_map(0, 'x', 'J', function()
      mark_actions.toggle_mark 'v'
    end, {
      noremap = true,
      silent = true,
    })
    buf_map(0, 'n', '-', actions.up, { noremap = true, silent = true })

    vim.opt_local.number = false
    vim.opt_local.relativenumber = false

    vim.opt_local.colorcolumn = nil
  end,
})

-- Reload lir once a session has been loaded. Otherwise, lir might load after
-- the session and if a folder was active, then the buffer would break.
vim.api.nvim_create_autocmd('SessionLoadPost', {
  group = group,
  callback = function()
    require('lir').init()
  local filetype = vim.fn.getbufvar(bufnum, '&filetype')

    local folder_name = vim.fn.expand('%:p')
      :gsub(vim.pesc(vim.loop.cwd() .. '/'), '')
      :gsub(vim.pesc(vim.fn.expand '$HOME'), '~')

    if #folder_name > 0 then
      vim.opt_local.winbar = folder_name
    else
      vim.opt_local.winbar = vim.fn.expand('%:p'):gsub(vim.pesc(vim.fn.expand '$HOME'), '~')
  end
  end,
})

function _G.LirSettings()
  vim.cmd [[augroup LirCloseOnWinLeave]]
  vim.cmd [[  autocmd!]]
  vim.cmd [[  autocmd WinLeave <buffer> if get(w:, 'lir_is_float', v:false) | call nvim_win_close(0, v:true) | endif]]
  vim.cmd [[augroup END]]
end

vim.cmd [[augroup lir-settings]]
vim.cmd [[  autocmd!]]
vim.cmd [[  autocmd Filetype lir :lua LirSettings()]]
vim.cmd [[augroup END]]
