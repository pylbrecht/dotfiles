local fzf = require('fzf-lua')

fzf.setup({
  winopts = {
    win_height = 1,
    win_width = 1,
    win_border = true,
    preview = {
      vertical = 'up:75%',
      layout = 'vertical',
    }
  }
})

-- TODO: find better mnemonics
vim.api.nvim_set_keymap("n", "<leader>f", ":FzfLua files<cr>", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>gf", ":FzfLua git_files<cr>", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>b", ":FzfLua buffers<cr>", {silent = true})
vim.api.nvim_set_keymap("n", "<leader>/", ":FzfLua live_grep<cr>", {silent = true})
