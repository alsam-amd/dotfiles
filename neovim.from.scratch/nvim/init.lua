require("settings")

-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set up plugins
require('lazy').setup ({
{
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "cpp", "c", "lua", "vim", "vimdoc", "query", "rust" }, -- Add "lua" here
    highlight = {
      enable = true,
    },
  },
  build = ":TSUpdate"
},

{
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
},

{
  "mbbill/undotree",
  lazy = true,
  keys = {
    { "<leader>u", function() vim.cmd.UndotreeToggle() end,
      desc = "Show nvim undotree",
    },
    config = true,
  },
},

{
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  opts = {}
  ---@diagnostic enable: missing-fields
},

{
  'jakobwesthoff/project-fzf.nvim',
  dependencies = {
    'ahmedkhalf/project.nvim', -- Must be configured separately
    'ibhagwan/fzf-lua',
  },
  opts = {},  -- Will call require('project-fzf').setup(opts)
},

{
  "NeogitOrg/neogit",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required

    -- Only one of these is needed.
    "sindrets/diffview.nvim",        -- optional
    "esmuellert/codediff.nvim",      -- optional

    -- Only one of these is needed.
    --"nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",              -- optional
    --"nvim-mini/mini.pick",           -- optional
    --"folke/snacks.nvim",             -- optional
  },
  cmd = "Neogit",
  keys = {
    { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" }
  }
},

{
   'VonHeikemen/lsp-zero.nvim',
   branch = "v1.x",
   dependencies = {
      -- LSP support
      'neovim/nvim-lspconfig',

      -- Autocompletetion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lua',

      -- Snippets
      'L3MON4D3/LuaSnip',
      'rafamadriz/friendly-snippets',
   },
},

{
    'williamboman/mason.nvim',
    dependencies = {
      'williamboman/mason-lspconfig.nvim',
      'nvim-lua/plenary.nvim',
    },

    servers = {
       "lua_ls",
       "clangd",
       "rust_analyzer",
    },
}

})

vim.lsp.enable('clangd')
vim.lsp.enable('rust_analyzer')
vim.lsp.enable('lua_ls')
