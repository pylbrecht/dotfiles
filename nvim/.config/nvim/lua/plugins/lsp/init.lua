return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp',
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
      local mason_lspconfig = require('mason-lspconfig')
      for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
        local success, opts = pcall(require, "plugins.lsp." .. server)
        if not success then
          opts = {}
        end

        opts.capabilities = require('blink.cmp').get_lsp_capabilities(opts.capabilities)

        vim.lsp.enable(server)
        vim.lsp.config(server, opts)
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
          vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)

          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if not client then
            return
          end

          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = ev.buf,
              callback = function()
                local excluded_projects = { "qutebrowser" }

                for _, project in ipairs(excluded_projects) do
                  if vim.fn.expand("%:p:h"):find(project) then
                    return
                  end
                end

                -- The order fixAll -> format (sync) -> organizeImports seems to matter for avoiding race conditions.
                -- https://github.com/astral-sh/ruff-lsp/issues/409#issuecomment-2764741595
                if client.name == "ruff" then
                  vim.lsp.buf.code_action({
                    context = {
                      only = { 'source.fixAll' }
                    },
                    apply = true,
                  })

                  vim.lsp.buf.format({ async = false })

                  vim.lsp.buf.code_action({
                    context = {
                      only = { 'source.organizeImports' }
                    },
                    apply = true,
                  })
                  -- https://github.com/astral-sh/ruff-lsp/issues/95
                  -- TODO(pylbrecht): maybe use conform.nvim?
                  vim.wait(100)
                elseif client.name == "rust_analyzer" then
                  vim.lsp.buf.format({ bufnr = ev.buf, id = client.id })
                else
                  vim.lsp.buf.format({ async = false })
                end

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
