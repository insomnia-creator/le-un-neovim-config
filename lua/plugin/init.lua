--asdfghghghghghghghg i LOVE TO MAKE NEOVIM PKUGIN I AME SUPERRIRRRR

return {
  'wbthomason/packer.nvim',
  {'neovim/nvim-lspconfig', config = function ()
    require 'plugin.lspconf'
  end},
  'folke/lazy.nvim',
  'xiyaowong/nvim-transparent',
  'nvim-lua/plenary.nvim',
  'alvarosevilla95/luatab.nvim',
  'windwp/nvim-autopairs',
  'sigmasd/deno-nvim',
  {
    'junnplus/lsp-setup.nvim',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim'
    }
  }, ------- lisp setup
  'jose-elias-alvarez/typescript.nvim',
  'j-hui/fidget.nvim',
  'goolord/alpha-nvim',
  {
    "amrbashir/nvim-docs-view",
    lazy = true,
    cmd = "DocsViewToggle",
    config = function ()
      require('docs-view').setup {
        position = "right",
        width = 60,
      }
    end

  },
  {
    "folke/trouble.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons"
    }
  },
  'onsails/lspkind.nvim',
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
      }
  },
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',
  'rcarriga/nvim-notify',
  'simrat39/rust-tools.nvim', --crab lang tooling
  'akinsho/flutter-tools.nvim', --best lang tooling
  'nanotee/sqls.nvim',
  'ray-x/web-tools.nvim', -- i will 10/10 never use it
  'davidgranstrom/nvim-markdown-preview', -- i will 0/10 never use it,
  'brenoprata10/nvim-highlight-colors', --cool plugin
  {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function ()
      require 'plugin.treesitter'
    end,
    dependencies = {
      'windwp/nvim-ts-autotag',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/playground'
    }
  },
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.0',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim'
    }
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
'tamago324/lir.nvim',
"jayp0521/mason-null-ls.nvim",
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require 'project_nvim'.setup {}
    end
  },
  'mortepau/codicons.nvim',
  'petertriho/cmp-git',
  'tamton-aquib/staline.nvim',
  {
  'shaunsingh/nord.nvim',
    lazy = true
  },
  'kdheepak/lazygit.nvim',
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "SmiteshP/nvim-navic"
    },
    lazy = true,
    event = "LspAttach"
  },
  'karb94/neoscroll.nvim',
  'andweeb/presence.nvim',
  'numToStr/Comment.nvim',
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require 'plugin.lsp.null_ls'
    end
  },
  'MunifTanjim/prettier.nvim',
  'nanozuki/tabby.nvim',
  'lewis6991/gitsigns.nvim'
}
