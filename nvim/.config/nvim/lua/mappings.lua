-- follow vim mnemonics for yanking
vim.api.nvim_set_keymap("n", "Y", "y$", {})

-- H is easier to type than ^
vim.api.nvim_set_keymap("n", "H", "^", {})
vim.api.nvim_set_keymap("o", "H", "^", {})
vim.api.nvim_set_keymap("v", "H", "^", {})

vim.api.nvim_set_keymap("n", "Q", "@@", {})

-- Git
vim.api.nvim_set_keymap("n", "<leader>gb", ":Git blame<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gs", ":tab Git<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gf", ":Telescope git_files<cr>", {})

-- vim-test
vim.api.nvim_set_keymap("n", "<leader>tt", ":TestNearest<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>ta", ":TestFile<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>tl", ":TestLast<cr>", {})

-- I am not a good typist
vim.cmd([[
	cnoreabbrev Q q
	cnoreabbrev W w
	cnoreabbrev Wq wq
	cnoreabbrev Qa qa
]])