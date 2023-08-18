-- follow vim mnemonics for yanking
vim.api.nvim_set_keymap("n", "Y", "y$", {})

-- H is easier to type than ^
vim.api.nvim_set_keymap("n", "H", "^", {})
vim.api.nvim_set_keymap("o", "H", "^", {})
vim.api.nvim_set_keymap("v", "H", "^", {})
-- L is easier to type than $
vim.api.nvim_set_keymap("n", "L", "$", {})
vim.api.nvim_set_keymap("o", "L", "$", {})
vim.api.nvim_set_keymap("v", "L", "$", {})

vim.api.nvim_set_keymap("n", "Q", "@@", {})

-- general
vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope find_files<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>/", ":Telescope live_grep<cr>", {})
vim.api.nvim_set_keymap("n", "]b", ":bnext<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "[b", ":bprevious<cr>", { silent = true })


-- Git
vim.api.nvim_set_keymap("n", "<leader>gb", ":Git blame<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gl", ":tab Git log<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gs", ":tab Git<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gf", ":Telescope git_files<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gw", ":Gwrite<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gr", ":Gread<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gc", ":G commit --verbose<cr>", {})

-- LSP
vim.api.nvim_set_keymap("n", "gd", ":Telescope lsp_definitions<cr>", {})
vim.api.nvim_set_keymap("n", "gr", ":Telescope lsp_references<cr>", {})


-- auto-session / session-lens
vim.api.nvim_set_keymap("n", "<leader>ss", ":Telescope session-lens search_session<cr>", {})


-- vim-test
vim.api.nvim_set_keymap("n", "<leader>tt", ":TestNearest<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>ta", ":TestFile<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>tl", ":TestLast<cr>", {})

-- move lines up/down
-- https://vim.fandom.com/wiki/Moving_lines_up_or_down
vim.api.nvim_set_keymap("v", "<C-j>", ":m '>+1<cr>gv=gv", {})
vim.api.nvim_set_keymap("v", "<C-k>", ":m '<-2<cr>gv=gv", {})

-- I am not a good typist
vim.cmd([[
	cnoreabbrev Q q
	cnoreabbrev W w
	cnoreabbrev Wq wq
	cnoreabbrev Qa qa
]])
