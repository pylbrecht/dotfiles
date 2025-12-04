return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      vim.opt.termguicolors = true
      local bufferline = require('bufferline')
      bufferline.setup({
        options = {
          mode = "tabs",
          always_show_bufferline = false,
          show_buffer_close_icons = false,
          show_tab_indicators = false,
          numbers = "none",
          style_preset = {
            bufferline.style_preset.no_italic,
          },
        }
      })
    end,
  }
}
