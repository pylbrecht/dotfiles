return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf_lua = require("fzf-lua")
    local opts = {
      "max-perf",
      winopts = {
        fullscreen = true,
        preview = {
          default  = "builtin",
          layout   = "vertical",
          vertical = "up:70%",
          title    = false,
        }
      },
      keymap = {
        builtin = {
          true,
          ["<C-u>"] = "preview-page-up",
          ["<C-d>"] = "preview-page-down"
        },
      },
      actions = {
        files = {
          true,
          ["ctrl-x"] = fzf_lua.actions.file_split,
          ["ctrl-q"] = fzf_lua.actions.file_sel_to_q
        }
      },
      grep = {
        rg_glob = true,
      }
    }
    fzf_lua.setup(opts)
    fzf_lua.register_ui_select()

    vim.keymap.set("n", "<leader>f", fzf_lua.files, {})
    vim.keymap.set("n", "<leader>b", fzf_lua.buffers, {})
    vim.keymap.set("n", "<leader>h", fzf_lua.help_tags, {})
    vim.keymap.set("n", "<leader>/", fzf_lua.live_grep, {})
    vim.keymap.set("n", "<leader>gf", fzf_lua.git_files, {})
    vim.keymap.set("n", "gra", fzf_lua.lsp_code_actions, {})
    vim.keymap.set("n", "gd", fzf_lua.lsp_definitions, {})
    vim.keymap.set("n", "gD", function()
      fzf_lua.lsp_definitions({
        sync = true,
        ignore_current_line = true,
        jump1 = true,
        jump1_action = fzf_lua.actions.file_vsplit,
        actions = {
          ["enter"] = fzf_lua.actions.file_vsplit,
        },
      })
    end, {})
    vim.keymap.set("n", "grr", fzf_lua.lsp_references, {})
    vim.keymap.set("n", "gri", fzf_lua.lsp_implementations, {})
    vim.keymap.set("n", "<leader>lt", fzf_lua.lsp_typedefs, {})
    vim.keymap.set("n", "<leader>lT", function()
      fzf_lua.lsp_typedefs({
        sync = true,
        ignore_current_line = true,
        jump1 = true,
        jump1_action = fzf_lua.actions.file_vsplit,
        actions = {
          ["enter"] = fzf_lua.actions.file_vsplit,
        },
      })
    end, {})
  end
}
