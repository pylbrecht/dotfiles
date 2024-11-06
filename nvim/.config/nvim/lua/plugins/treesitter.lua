return {
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
    build = ':TSUpdate',
    config = function()
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
    end,
  },
}
