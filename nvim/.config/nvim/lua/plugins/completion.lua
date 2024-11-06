return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
  {
    'saghen/blink.cmp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      'fang2hou/blink-copilot',
      {
        'Kaiser-Yang/blink-cmp-git',
        dependencies = { 'nvim-lua/plenary.nvim' }
      }
    },
    version = '*',
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
        kind_icons = {
          Copilot = "",
        },
      },
      signature = { enabled = true },
      completion = {
        list = { selection = { preselect = false, auto_insert = false } },
        documentation = { auto_show = true, auto_show_delay_ms = 0 },
        menu = {
          draw = {
            components = {
              label_description = {
                width = { "fill" },
              },
            },
          },
        },
      },
      sources = {
        default = {
          'git',
          'lsp',
          'path',
          'snippets',
          'buffer',
          'copilot',
        },
        providers = {
          git = {
            module = 'blink-cmp-git',
            name = 'Git',
            opts = {
              -- options for the blink-cmp-git
            },
          },
          snippets = {
            opts = {
              extended_filetypes = {
                jjdescription = { "gitcommit" }
              }
            }
          },
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
            opts = {
              max_completions = 3,
              max_attempts = 4,
            }
          },
        },
      },
    },
    opts_extend = { "sources.default" }
  }
}
