return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {
        'williamboman/mason.nvim',
        opts = {},
      },
      {
        'williamboman/mason-lspconfig.nvim',
        opts = { automatic_installation = true },
      },
      {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        opts = {}
      },
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local lspconfig = require('lspconfig')
      local mason_lspconfig = require('mason-lspconfig')
      for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
        local success, opts = pcall(require, "plugins.lsp." .. server)
        if not success then
          opts = {}
        end
        lspconfig[server].setup(opts)
      end

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)

          local builtin = require('telescope.builtin')
          vim.keymap.set("n", "gd", builtin.lsp_definitions, { silent = true })
          vim.keymap.set("n", "gD", function() builtin.lsp_definitions({ jump_type = "vsplit" }) end, { silent = true })
          vim.keymap.set("n", "gr", builtin.lsp_references, { silent = true })
          vim.keymap.set("n", "gi", builtin.lsp_implementations, { silent = true })

          local client = vim.lsp.get_client_by_id(ev.data.client_id)

          if client.supports_method("textDocument/formatting") then
            vim.keymap.set("n", "<Leader>lf", function()
              vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, { buffer = bufnr, desc = "[lsp] format" })
          end

          if client.supports_method("textDocument/rangeFormatting") then
            vim.keymap.set("x", "<Leader>lf", function()
              vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, { buffer = bufnr, desc = "[lsp] format" })
          end

          local au = vim.api.nvim_create_autocmd
          local ag = vim.api.nvim_create_augroup
          local clear_au = vim.api.nvim_clear_autocmds

          -- Autoformat on save
          local augroup = ag("LspFormatting", { clear = false })
          if client.supports_method("textDocument/formatting") then
            au("BufWritePre", {
              clear_au({ group = augroup, buffer = bufnr }),
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format()
              end,
            })
          end
        end
      })

      -- General mappings
      vim.keymap.set("n", "<leader>lr", ":LspRestart<cr>", { silent = true })
      vim.keymap.set('n', '<leader>ld', vim.diagnostic.open_float, { noremap = true, silent = true })
    end,
  },
}
