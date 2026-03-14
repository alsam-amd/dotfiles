-- return {
--   "wsdjeg/ctags.nvim",
--   event = "BufReadPre", -- or an appropriate event for lazy loading
--   config = function()
--     require("ctags").setup({
--       -- Your configuration options go here.
--       -- Example:
--       -- tags_file = ".tags",
--       -- ctags_generate_options = "--sort=yes --fields=SnZt --exclude=vendor/*",
--     })
--   end,
--   dependencies = {
--     -- Optional: if you want statusline integration
--     -- "nvim-lualine/lualine.nvim",
--     -- "kyazdani42/nvim-web-devicons",
--   },
-- }


return {
    'wsdjeg/ctags.nvim',
    config = function()
      require('ctags').setup()

      local function update_ctags_option()
        local project_root = vim.fn.getcwd()
        local dir = require('ctags.util').unify_path(require('ctags.config').cache_dir)
          .. require('ctags.util').path_to_fname(project_root)
        local tags = vim.tbl_filter(function(t)
          return not vim.startswith(
            t,
            require('ctags.util').unify_path(require('ctags.config').cache_dir)
          )
        end, vim.split(vim.o.tags, ','))
        table.insert(tags, dir .. '/tags')
        vim.o.tags = table.concat(tags, ',')
      end
      require('rooter').reg_callback(update_ctags_option)
    end,
    depends = {
      {
        'wsdjeg/job.nvim',
      },
      {
        'wsdjeg/rooter.nvim',
      },
    },
  }
