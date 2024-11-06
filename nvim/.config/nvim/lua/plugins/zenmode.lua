return {
  "folke/zen-mode.nvim",
  opts = {},
  config = function()
    local zenmode = require("zen-mode")
    vim.keymap.set("n", "<leader>z", zenmode.toggle, {})
  end,
}
