local lspkind = require "lspkind"
lspkind.init({
  symbol_map = {
    Copilot = "",
  },
})

require("luasnip.loaders.from_vscode").lazy_load()
local luasnip = require "luasnip"

vim.keymap.set({"i", "s"}, "<C-J>", function()
  if luasnip.expand_or_jumpable then
    luasnip.expand_or_jump()
  end
end, {silent = true})

vim.keymap.set({"i"}, "<C-k>", function() 
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, {silent = true})

local cmp = require "cmp"
cmp.setup {
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
    { name = "copilot" },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<C-y>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
}

