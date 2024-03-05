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
  'caenrique/nvim-maximize-window-toggle',
  'dhruvasagar/vim-zoom',
  'github/copilot.vim',
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
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'rafamadriz/friendly-snippets',
    },
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

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

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

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
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
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

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

vim.cmd([[
" Fix weird resizing issue when running 'alacritty --command nvim'
" https://github.com/neovim/neovim/issues/11330#issuecomment-723667383
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
]])
