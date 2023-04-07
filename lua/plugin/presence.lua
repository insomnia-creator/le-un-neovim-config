-- The setup config table shows all available config options with their default values:
require("presence"):setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "Potato PC editor on NASA Computer", -- Text displayed when hovered over the Neovim image
    -- Rich Presence text options
    editing_text        = "Escape key is not working anymore",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
    file_explorer_text  = "File explorer of 2020 with functionality of 6500 BC",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
    git_commit_text     = "Committing this editor away",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
    plugin_manager_text = "Configuring cancer itself",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
    reading_text        = "I forgot to add sudo",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
    workspace_text      = "My leader key is ',' btw",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
    line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})