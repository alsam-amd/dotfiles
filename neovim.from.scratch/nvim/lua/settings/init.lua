require("settings.opts")
vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus"
require("settings.lazy")
require("settings.remap")
require("lualine").setup()
require("ibl").setup()
