vim.api.nvim_set_keymap("v", "<leader>p", ":'<'>!sleek<cr>", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>pp", ":.!sleek<cr>", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>pa", ":!sleek %<cr>", {silent = true})
