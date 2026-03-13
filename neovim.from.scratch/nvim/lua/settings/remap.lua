vim.g.mapleader = " "
vim.keymap.set('n', '<leader>l', '<cmd>Lazy home<CR>', { desc = 'Open Lazy main menu' })
-- Map <leader>fp to open projects
vim.keymap.set('n', '<leader>fp', ':ProjectFzf<CR>', { noremap = true, silent = true })
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set('n', '<leader>ff', '<Cmd>FzfLua files<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>lg', '<Cmd>FzfLua live_grep<CR>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>b', '<Cmd>FzfLua buffers<CR>', { desc = 'List buffers' })

-- lsp && mason keymaps

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename)
