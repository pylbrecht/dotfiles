-- follow vim mnemonics for yanking
vim.api.nvim_set_keymap("n", "Y", "y$", {})

-- always use very magic
vim.keymap.set('n', '?', '?\\v')
vim.keymap.set('n', '/', '/\\v')
vim.keymap.set('c', '%s/', '%s/\\v')

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

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- toggle relativenumber (helpful during pairing)
vim.api.nvim_set_keymap("n", "<leader><leader>rn", ":setl relativenumber!<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "zq", ":bufdo! bd!<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "zd", ":bd!<cr>", { silent = true })

-- general
local telescope_builtin = require("telescope.builtin")
local telescope_opts = {prompt_title = false, preview_title = false, results_title = false}

vim.keymap.set("n", "<leader>f", function() telescope_builtin.find_files(telescope_opts) end, {})
vim.keymap.set("n", "<leader>b", function() telescope_builtin.buffers(telescope_opts) end, {})
vim.keymap.set("n", "<leader>/", function() telescope_builtin.live_grep(telescope_opts) end, {})
vim.keymap.set("n", "<leader>gf", function() telescope_builtin.git_files(telescope_opts) end, {})

vim.api.nvim_set_keymap("n", "]b", ":bnext<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "[b", ":bprevious<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "]c", ":cnext<cr>", { silent = true })
vim.api.nvim_set_keymap("n", "[c", ":cprevious<cr>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Git
vim.api.nvim_set_keymap("n", "<leader>gb", ":Git blame<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>glo", ":tab Git log --oneline -100<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>glg", ":tab Git log<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gs", ":tab Git<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gr", ":Gread<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gc", ":G commit --verbose<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gwl", ":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gwn", ":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", {})


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
