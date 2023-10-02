-- Based on https://github.com/nvim-lua/kickstart.nvim

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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
  'arcticicestudio/nord-vim',
  'caenrique/nvim-maximize-window-toggle',
  'dhruvasagar/vim-zoom',
  'github/copilot.vim',
  'jeetsukumaran/vim-pythonsense',
  'kyazdani42/nvim-web-devicons',
  'kylechui/nvim-surround',
  'ludovicchabant/vim-gutentags',
  'majutsushi/tagbar',
  'mattn/calendar-vim',
  'mattn/emmet-vim',
  'maxmellon/vim-jsx-pretty',
  'nvim-lua/plenary.nvim',
  'nvim-lualine/lualine.nvim',
  'rust-lang/rust.vim',
  'tpope/vim-abolish',
  'tpope/vim-commentary',
  'tpope/vim-eunuch',
  'tpope/vim-fugitive',
  'tpope/vim-markdown',
  'tpope/vim-obsession',
  'tpope/vim-repeat',
  'tpope/vim-rhubarb',
  'tpope/vim-sensible',
  'tpope/vim-sleuth',
  'tpope/vim-unimpaired',
  'vim-test/vim-test',
  'vimwiki/vimwiki',
  'yuezk/vim-js',

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
        theme = 'nord',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    config = function()
      require('ibl').setup {
        char = '┊',
        show_trailing_blankline_indent = false,
        scope = { show_start = false, show_end = false },
      }
    end,
  },

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
require("mappings")

require('nvim-treesitter.configs').setup({
    highlight = { enable = true },
    sync_install = false,
    ensure_installed = {
        "c",
        "css",
        "csv",
        "diff",
        "dockerfile",
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
local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"
-- vim way: ; goes to the direction you were moving.
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- plugins
require('lualine').setup({
    options = {
        extensions = { 'fugitive', 'quickfix' }
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
        layout_config = {
            horizontal = { width = 0.99, height = 0.99 }
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
    }
})

-- https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

-- FIXME: is this covered by Mason?
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

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
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

vim.cmd([[
" Fix weird resizing issue when running 'alacritty --command nvim'
" https://github.com/neovim/neovim/issues/11330#issuecomment-723667383
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
]])
