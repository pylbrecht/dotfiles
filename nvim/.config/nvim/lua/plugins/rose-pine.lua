return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = {
      highlight_groups = {
        ["@attribute.diff"] = { fg = "gold" },
        ["@text.diff.add"] = { bg = "foam", blend = 20 },
        ["@text.diff.delete"] = { bg = "love", blend = 20 }
      }
    },
    config = function()
      vim.cmd("colorscheme rose-pine-moon")
    end
  }
}
