local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

print("Hello from packer")
-- Install packer if packer is not found
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Install plugins
return packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- Packer
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

    use 'nvim-lua/plenary.nvim'
    use 'simrat39/symbols-outline.nvim' -- Show variable tree or whatever that's  called
    use "windwp/nvim-autopairs" 

    use {
        'junnplus/lsp-setup.nvim',
        requires = {
            'neovim/nvim-lspconfig',
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        }
    } -- LSP Setup
    
    use 'jose-elias-alvarez/typescript.nvim' -- Utilities for typescript

    use {
        "amrbashir/nvim-docs-view",
        opt = true,
        cmd = { "DocsViewToggle" },
    }

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }
  use 'onsails/lspkind.nvim'
  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
  }
  use 'rcarriga/nvim-notify' -- Notify
  use 'simrat39/rust-tools.nvim' -- The crablang tooling

  use 'akinsho/flutter-tools.nvim' -- The best lang tooling

  use 'nanotee/sqls.nvim' -- The Sequel to the Structured Query Language

  use 'ray-x/web-tools.nvim' -- Useful tools for quick webdev

  use 'davidgranstrom/nvim-markdown-preview' -- Markdown preview

  use 'nvim-treesitter/nvim-treesitter'

  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
  -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

 use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  
  -- File Explorer
  use {
    'theblob42/drex.nvim',
    requires = 'kyazdani42/nvim-web-devicons', -- optional
  }

    use 'sunjon/shade.nvim' -- Darken windows that are currently not focused in neovim

    use "jayp0521/mason-null-ls.nvim"

    use {
      "ahmedkhalf/project.nvim",
     
    }

    use 'tamton-aquib/staline.nvim' -- Status line
    use { "catppuccin/nvim", as = "catppuccin" }
    --VSCode like winbar
    --[[
      use {
              "utilyre/barbecue.nvim",
              requires = {
                "neovim/nvim-lspconfig",
                "smiteshp/nvim-navic",
                "kyazdani42/nvim-web-devicons", -- optional
              },
              config = function()
                require("barbecue").setup()
              end,
            } 
            
    ]] --
      
    use 'nanozuki/tabby.nvim' -- Tabline
    use 'karb94/neoscroll.nvim' -- Smooth scrolling
    use 'andweeb/presence.nvim' -- Rich presence on the cancer app
    
    use 'numToStr/Comment.nvim'

    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')

    use ('beauwilliams/focus.nvim')

end)