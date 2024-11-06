return {
  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        branch = "main",
        init = function()
          -- Disable entire built-in ftplugin mappings to avoid conflicts.
          -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
          vim.g.no_plugin_maps = true

          -- Or, disable per filetype (add as you like)
          -- vim.g.no_python_maps = true
          -- vim.g.no_ruby_maps = true
          -- vim.g.no_rust_maps = true
          -- vim.g.no_go_maps = true
        end,
        config = function()
          -- put your config here
        end,
      },
      {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {
          enable = true,      -- Enable this plugin (Can be enabled/disabled later via commands)
          max_lines = 0,      -- How many lines the window should span. Values <= 0 mean no limit.
          min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
          line_numbers = true,
          multiline_threshold = 1, -- Maximum number of lines to show for a single context
        },
      },
    },
    build = ":TSUpdate",
    config = function()
      local treesitter = require("nvim-treesitter")
      treesitter.setup()

      local parsers = {
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
      }

      treesitter.install(parsers)
      -- gladfully taken from
      -- https://github.com/gennaro-tedesco/dotfiles/blob/b18fd749d6eb17fc4a57ea09cb074b9a203b1e28/nvim/lua/plugins/treesitter.lua#L25-L64
      require("nvim-treesitter-textobjects").setup({
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
          },
        },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = parsers,
        callback = function()
          -- syntax highlighting, provided by Neovim
          vim.treesitter.start()
          -- indentation, provided by nvim-treesitter
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
