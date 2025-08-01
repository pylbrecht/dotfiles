vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")
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

-- yank current buffer's file name to system clipboard
local copy_current_filename = function()
	-- some of my project paths contain hyphens, which need to be escaped
	-- https://stackoverflow.com/a/34953646
	local function escape_pattern(text)
		return text:gsub("([^%w])", "%%%1")
	end
	local git_root = vim.fs.root(0, ".git")
	local path = vim.fn.expand("%:p")
	local rooted_name = string.gsub(path, escape_pattern(git_root .. "/"), "", 1)
	vim.fn.setreg("+", rooted_name)
end
vim.keymap.set("n", "<leader>yf", copy_current_filename, {})

vim.api.nvim_set_keymap("n", "<leader>,", "<C-^>", { noremap = true, silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Git
vim.api.nvim_set_keymap("n", "<leader>gb", ":Git blame<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>gll", ":tab Git log -L :<cword>:%<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>glo", ":tab Git log --oneline --decorate -100<cr>", {})
vim.api.nvim_set_keymap("n", "<leader>glm", ":tab Git log --oneline --decorate main..<cr>", {})
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
