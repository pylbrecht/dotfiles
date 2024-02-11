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

-- keep cursor while scrolling
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- toggle relativenumber (helpful during pairing)
vim.api.nvim_set_keymap("n", "<leader><leader>rn", ":setl relativenumber!<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "zq", ":bufdo! bd!<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "zd", ":bd!<cr>", { silent = true })

-- general
vim.api.nvim_set_keymap("n", "<leader>f", ":Telescope find_files<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>b", ":Telescope buffers<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>/", ":Telescope live_grep<cr>", {})
vim.api.nvim_set_keymap("n", "]b", ":bnext<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "[b", ":bprevious<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "]c", ":cnext<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "[c", ":cprevious<cr>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Git
vim.api.nvim_set_keymap("n", "<leader>gb", ":Git blame<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gl", ":tab Git log<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gs", ":tab Git<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gf", ":Telescope git_files<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gr", ":Gread<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gc", ":G commit --verbose<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gwl", ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gwn", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", {})

-- Github Copilot
vim.api.nvim_set_keymap("i", "<C-d>", "<Plug>(copilot-next)", {})
vim.api.nvim_set_keymap("i", "<C-u>", "<Plug>(copilot-previous)", {})

-- LSP
local builtin = require('telescope.builtin')
vim.keymap.set("n", "gd", builtin.lsp_definitions, {silent = true})
vim.keymap.set("n", "gD", function() builtin.lsp_definitions({jump_type = "vsplit"}) end, {silent = true})
vim.keymap.set("n", "gr", builtin.lsp_references, {silent = true})


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
