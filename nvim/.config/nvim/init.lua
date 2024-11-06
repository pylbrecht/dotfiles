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

require("mason").setup()
require("mason-lspconfig").setup({
  automatic_installation = true
})
require("nvim-surround").setup()
require("telescope").setup({
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      vertical = {
        height = 0.9,
        width = 0.9,
        prompt_position = "top",
        preview_height = 0.7,
        preview_cutoff = 1,
      },
    },
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      }
    }
  },
  pickers = {
    lsp_references = {
      show_line = false,
    }
  },
  extensions = {
    "git_worktree"
  }
})
require("ibl").setup({
  indent = {
    char = '┊',
  },
  scope = { show_start = false, show_end = false },
})

require('treesitter-context').setup({
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 1, -- Maximum number of lines to show for a single context
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

require("mini.ai").setup({})
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
