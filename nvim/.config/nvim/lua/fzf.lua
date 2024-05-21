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
vim.keymap.set("n", "<leader>f", fzf.files, {silent = true})
vim.keymap.set("n", "<leader>gf", fzf.git_files, {silent = true})
vim.keymap.set("n", "<leader>b", fzf.buffers, {silent = true})
vim.keymap.set("n", "<leader>/", fzf.live_grep, {silent = true})
