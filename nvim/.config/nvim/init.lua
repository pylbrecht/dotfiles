-- Based on https://github.com/nvim-lua/kickstart.nvim

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.user_emmet_leader_key = '<C-e>'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function ()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
      require("copilot_cmp").setup()
    end
  },
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "andymass/vim-matchup",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      require("nvim-treesitter.configs").setup({
        matchup = {
          enable = true,
          disable_virtual_text = true,
        },
      })
    end
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      disabled_filetypes = {'tagbar', 'fugitive', 'fugitiveblame', 'mason'},
      max_count = 3,
    }
  },
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
  {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
    "jay-babu/mason-nvim-dap.nvim",
  },
  'mfussenegger/nvim-dap',
  'mfussenegger/nvim-dap-python',
  'theHamsta/nvim-dap-virtual-text',
  'caenrique/nvim-maximize-window-toggle',
  'dhruvasagar/vim-zoom',
  'nvim-tree/nvim-web-devicons',
  'kylechui/nvim-surround',
  'majutsushi/tagbar',
  'mattn/emmet-vim',
  'nvim-lua/plenary.nvim',
  'nvim-lualine/lualine.nvim',
  'rust-lang/rust.vim',
  'tpope/vim-abolish',
  'tpope/vim-eunuch',
  'tpope/vim-fugitive',
  'tpope/vim-markdown',
  'tpope/vim-repeat',
  'tpope/vim-sensible',
  'tpope/vim-sleuth',
  'tpope/vim-unimpaired',
  'vim-test/vim-test',
  'vimwiki/vimwiki',
  'MunifTanjim/prettier.nvim',

  { 'echasnovski/mini.nvim', version = false },

  { 'rose-pine/neovim', name = 'rose-pine' },

  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  { 'fatih/vim-go', build = ':GoUpdateBinaries' },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
      'folke/neodev.nvim',
    },
  },

  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'onsails/lspkind.nvim',
      { 'L3MON4D3/LuaSnip', build = "make install_jsregexp" },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'rafamadriz/friendly-snippets',
    },
    config = function()
      require "completion"
    end,
  },

  { 'folke/which-key.nvim', opts = {} },

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })

        -- don't override the built-in and fugitive keymaps
        local gs = package.loaded.gitsigns
        vim.keymap.set({'n', 'v'}, ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true, buffer = bufnr, desc = "Jump to next hunk"})
        vim.keymap.set({'n', 'v'}, '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, {expr=true, buffer = bufnr, desc = "Jump to previous hunk"})
      end,
    },
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'rose-pine',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  { 'lukas-reineke/indent-blankline.nvim', main = "ibl", opts = {} },
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
    build = ':TSUpdate',
  },
}, {})

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
      horizontal = { width = 0.99, height = 0.99 },
      vertical = { width = 0.99, height = 0.99, preview_height = 0.6 }
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

vim.cmd([[
" Fix weird resizing issue when running 'alacritty --command nvim'
" https://github.com/neovim/neovim/issues/11330#issuecomment-723667383
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
]])
