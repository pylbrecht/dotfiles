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
require("lsp")
require("mappings")
require("colorscheme")
require("plugins")
require("debuggers")
require("options")

require('nvim-treesitter.configs').setup({
  highlight = { enable = true },
  sync_install = false,
  ensure_installed = {
    "c",
    "css",
    "csv",
    "diff",
    "dockerfile",
    "gitcommit",
    "git_rebase",
    "go",
    "html",
    "htmldjango",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "regex",
    "rust",
    "sql",
    "typescript",
    "vimdoc",
    "vue",
    "yaml",
  },
  -- gladfully taken from
  -- https://github.com/gennaro-tedesco/dotfiles/blob/b18fd749d6eb17fc4a57ea09cb074b9a203b1e28/nvim/lua/plugins/treesitter.lua#L25-L64
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = { query = "@function.outer", desc = "select around function" },
        ["if"] = { query = "@function.inner", desc = "select inside function" },
        ["ac"] = { query = "@class.outer", desc = "select around class" },
        ["ic"] = { query = "@class.inner", desc = "select inside class" },
        ["al"] = { query = "@loop.outer", desc = "select around loop" },
        ["il"] = { query = "@loop.inner", desc = "select inside loop" },
        ["ab"] = { query = "@block.outer", desc = "select around block" },
        ["ib"] = { query = "@block.inner", desc = "select inside block" },
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]f"] = { query = "@function.outer", desc = "go to next function" },
        ["]]"] = { query = "@class.outer", desc = "go to next class" },
        ["]l"] = { query = "@loop.outer", desc = "go to next loop" },
      },
      goto_next_end = {
        ["]F"] = { query = "@function.outer", desc = "go to end of next function" },
        ["]["] = { query = "@class.outer", desc = "go to end of next class" },
        ["]L"] = { query = "@loop.outer", desc = "go to end of next loop end" },
      },
      goto_previous_start = {
        ["[f"] = { query = "@function.outer", desc = "go to previous function" },
        ["[["] = { query = "@class.outer", desc = "go to previous class" },
        ["[l"] = { query = "@loop.outer", desc = "go to previous loop" },
      },
      goto_previous_end = {
        ["[F"] = { query = "@function.outer", desc = "go to end of previous function" },
        ["[]"] = { query = "@class.outer", desc = "go to end of previous class" },
        ["[L"] = { query = "@loop.outer", desc = "go to end of previous loop" },
      }
    },
  },
})

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
