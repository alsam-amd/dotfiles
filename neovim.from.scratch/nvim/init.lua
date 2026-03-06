require("settings")
print("hello")

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
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    }
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


})
