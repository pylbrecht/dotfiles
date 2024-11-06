local modules = {
  "mini.ai",
  "mini.bracketed",
}

return {
  {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      for _, module in ipairs(modules) do
        require(module).setup({})
      end
    end,
  },
}
