local M = {}

function M.map(modes, lhs, rhs, opts)
    opts = opts or {}
    opts.noremap = opts.noremap == nil and true or opts.noremap
    if type(modes) == 'string' then
      modes = { modes }
    end
    for _, mode in ipairs(modes) do
      if type(rhs) == 'string' then
        vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
      else
        opts.callback = rhs
        vim.api.nvim_set_keymap(mode, lhs, '', opts)
      end
    end
  end

  function M.buf_map(buffer, modes, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap == nil and true or opts.noremap
  if type(modes) == 'string' then
    modes = { modes }
  end
  for _, mode in ipairs(modes) do
    if type(rhs) == 'string' then
      vim.api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, opts)
    else
      opts.callback = rhs
      vim.api.nvim_buf_set_keymap(buffer, mode, lhs, '', opts)
    end
  end
end
local map = M.map
  
  -- Change leader to a comma
  vim.g.mapleader = ','
  
  -----------------------------------------------------------
  -- Neovim shortcuts
  -----------------------------------------------------------
  
  -- Clear search highlighting with <leader> and c
  map('n', '<leader>c', ':nohl<CR>')
  
  map('i', '{<CR>', '{<CR>}<C-o>O', {noremap = true})
  
  -- Move around splits using Ctrl + {h,j,k,l}
  map('n', '<C-h>', '<C-w>h')
  map('n', '<C-j>', '<C-w>j')
  map('n', '<C-k>', '<C-w>k')
  map('n', '<C-l>', '<C-w>l')
  map('n', '<C-Return>', '<CR><CR><C-o>k<Tab>')
  
  -- Reload configuration without restart nvim
  map('n', '<leader>r', ':so %<CR>')
  
  -- Fast saving with <leader> and s
  
  -- Close all windows and exit from Neovim with <leader> and q
  map('n', '<leader>q', ':qa!<CR>')

  -- Map DocView
  map('n', "<leader>d", ':DocsViewToggle <CR>')

  -- Map drex.nvim

  map('n', "<leader>iw", ":TroubleToggle workspace_diagnostics <CR>")
  map('n', "<leader>it", ":TroubleToggle document_diagnostics <CR>")

return M