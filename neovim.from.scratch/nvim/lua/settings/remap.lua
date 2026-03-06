vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--vim.keymap.set("n", "<leader>n", ":Neotree<CR>")
-- Map <leader>fp to open projects
vim.keymap.set('n', '<leader>fp', ':ProjectFzf<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- https://www.reddit.com/r/neovim/comments/yccqik/cant_get_remaps_with_space_as_leader_to_work/
-- vim.keymap.set('n', '<leader>v', function() print("Hello, world!!!!!!!!!!!") end)
-- vim.keymap.set('n', '<C-v>', function() print("Goodbye, world") end)
