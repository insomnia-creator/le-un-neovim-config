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
  -- is now in init.lua 
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
  map('n', '<leader>r', ':so %<CR>  :echo "Reloaded neovim configuration"<CR>')
  
  -- Fast saving with <leader> and s
  
  -- Close all windows and exit from Neovim with <leader> and q
  map('n', '<leader>q', ':qa!<CR>')

  -- Map DocView
  map('n', "<leader>d", ':DocsViewToggle <CR>', { silent = true })
  -- Trouble!
  map('n', "<leader>iw", ":TroubleToggle workspace_diagnostics <CR>", { silent = true })
  map('n', "<leader>if", ":TroubleToggle document_diagnostics <CR>", { silent = true })


  --Navbuddy
  map('n', "<leader>v", ":lua require('nvim-navbuddy').open() <CR>", {silent = true})
  -- Go to tab by number
  map('n', "<leader>1", "1gt", { silent = true })
  map('n', "<leader>2", "2gt", { silent = true })
  map('n', "<leader>3", "3gt", { silent = true })
  map('n', "<leader>4", "4gt", { silent = true })
  map('n', "<leader>5", "5gt", { silent = true })
  map('n', "<leader>6", "6gt", { silent = true })
  map('n', "<leader>7", "7gt", { silent = true })
  map('n', "<leader>8", "8gt", {silent = true})
  map('n', "<leader>9", "9gt", {silent = true})
  map('n', '<leader>w', ":tabc <CR>", {silent = true})
  map('n', '<leader>F', [[expand('%') == '' ? ':e ' . getcwd() . '<cr>' : ':e %:h<cr>']], { expr = true, silent = true })
  map('n', '<leader>f', ":lua require('lir.float').toggle()<CR>",  { silent = true})
  --Prettier!
  map('n', '<leader>p', ":Prettier<CR>")
return M
