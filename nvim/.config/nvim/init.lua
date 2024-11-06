require("config.lazy")

vim.cmd([[
set nocompatible
let g:python3_host_prog = "~/.pyenv/versions/neovim/bin/python"

let g:nvim_config_root = stdpath('config')
let g:config_file_list = ['general.vim',
\ 'mappings.vim',
\ 'plugins.vim',
\ ]

for f in g:config_file_list
  execute 'source ' . g:nvim_config_root . '/' . f
endfor
]])

-- personal stuff
require("mappings")
require("colorscheme")
require("debuggers")
require("options")

-- plugins
require('lualine').setup({
  options = {
    extensions = { 'fugitive', 'quickfix' }
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 3, -- 0 = just filename, 1 = relative path, 2 = absolute path
      },
    },
  }
})

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

require("nvim-surround").setup()
require("ibl").setup({
  indent = {
    char = '┊',
  },
  scope = { show_start = false, show_end = false },
})

require('prettier').setup({
  bin = 'prettierd',
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "css",
    "scss",
    "json",
    "graphql",
    "markdown",
    "vue",
    "yaml",
    "html",
    "svelte",
    "javascript.jsx",
    "typescript.tsx",
    "jsonc",
    "json5",
    "yaml"
  }
})

require("nvim-autopairs").setup({})
require("gitlinker").setup({
    callbacks = {
        ["git.envelio.sh"] = function(url_data)
          local url = require("gitlinker.hosts").get_gitlab_type_url(url_data)
          url = string.gsub(url, "git.envelio.sh", "git.envelio.org")
          return url
        end
  },
})

vim.cmd([[
" Fix weird resizing issue when running 'alacritty --command nvim'
" https://github.com/neovim/neovim/issues/11330#issuecomment-723667383
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
]])
