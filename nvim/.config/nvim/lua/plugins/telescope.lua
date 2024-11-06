return {
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
    opts = {
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
        },
      },
      find_files = {
        find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
      },
      extensions = {
        "git_worktree"
      }

    }
  },
}
