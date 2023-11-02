vim.api.nvim_set_keymap("v", "<leader>p", ":'<'>!black-macchiato<cr>", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>pp", ":.!black-macchiato<cr>", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>pa", ":!black %<cr>", {silent = true})
