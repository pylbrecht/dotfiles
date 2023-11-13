require("rose-pine").setup({
  highlight_groups = {
    ["@attribute.diff"] = { fg = "gold" },
    ["@text.diff.add"] = { bg = "foam", blend = 20 },
    ["@text.diff.delete"] = { bg = "love", blend = 20 }
  }
})

vim.cmd("colorscheme rose-pine-moon")
