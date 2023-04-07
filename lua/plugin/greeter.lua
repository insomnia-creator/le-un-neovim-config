
local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local dashboard = require('alpha.themes.dashboard')


-- Banner
local prayer = {
  "Dear God! O Father!",
  "Help us eradicate usage of React!",
  "Help a stranded C developer to realise how terrible his singly linked list is!",
  "Help the Rustacean to understand why his language won't solve world hunger!",
  "Help the Lua user to look into better alteratives!",
  "Help the git-clone-make child to create a program of his own!",
  "Help the TypeScript user to understand the power of vanilla JavaScript,",
  "And the latter to understand why his life is pointless!",
  "Help the Dart user find solace and peace,",
  "The Swift user money in his pocket,",
  "The NixOS user to contemplate the time he wasted,",
  "The Neovim RC creator to touch grass!",
  "When all of these are satisfied, help bring all men to heaven!",
  "Amen"
}

dashboard.section.header.val = prayer

-- Menu
dashboard.section.buttons.val = {
  dashboard.button('n', 'ﱐ  New file', ':ene <BAR> startinsert<CR>'),
  dashboard.button('f', '  Search file', ':Telescope find_files<CR>'),
  dashboard.button('u', 'ﮮ  Update', ':Lazy<CR>'),
  dashboard.button('s', '  Settings', ':e $MYVIMRC<CR>'),
  dashboard.button('q', '  Quit', ':qa<CR>'),
}


alpha.setup(dashboard.config)
