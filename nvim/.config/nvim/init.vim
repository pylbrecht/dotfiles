" auto-install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible

call plug#begin(stdpath('data') . '/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'caenrique/nvim-maximize-window-toggle'
Plug 'dhruvasagar/vim-zoom'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'github/copilot.vim'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kylechui/nvim-surround'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'mattn/calendar-vim'
Plug 'mattn/emmet-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'rust-lang/rust.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
" FIXME: currently interfering with treesitter-textobjects mappings
" Plug 'tpope/vim-unimpaired'
Plug 'vim-test/vim-test'
Plug 'vimwiki/vimwiki'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'williamboman/mason.nvim'
Plug 'yuezk/vim-js'

call plug#end()

let g:python3_host_prog = "~/.pyenv/versions/neovim/bin/python"

let g:nvim_config_root = stdpath('config')
let g:config_file_list = ['general.vim',
    \ 'mappings.vim',
    \ 'plugins.vim',
    \ ]

for f in g:config_file_list
    execute 'source ' . g:nvim_config_root . '/' . f
endfor

lua <<EOF
-- personal stuff
require("mappings")

require('nvim-treesitter.configs').setup({
    highlight = { enable = true },
    sync_install = false,
    ensure_installed = {
        "c",
        "python",
        "rust",
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
EOF

" Fix weird resizing issue when running 'alacritty --command nvim'
" https://github.com/neovim/neovim/issues/11330#issuecomment-723667383
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
