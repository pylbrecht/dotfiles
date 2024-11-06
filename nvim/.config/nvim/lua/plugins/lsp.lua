-- TODO: use metatable to set default of `function() return {} end` if server
-- is not configured
-- TODO: move each server config to its own .lua file (e.g. plugins/lsp/ruff.lua).
local servers = {
  lua_ls = function() return {} end,
  ts_ls = function()
    local mason_registry = require('mason-registry')
    local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() ..
        '/node_modules/@vue/language-server'
    return {
      init_options = {
        plugins = {
          {
            name = '@vue/typescript-plugin',
            location = vue_language_server_path,
            languages = { 'vue' },
          },
        },
      },
      filetypes = {
        'typescript',
        'javascript',
        'javascriptreact',
        'typescriptreact',
        'vue'
      },
    }
  end,
  volar = function()
    -- TODO: traverse up (lspconfig.util.traverse_parents) the directory tree to
    -- find TypeScript server
    --
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar
    -- Use a local server and fall back to a global TypeScript Server installation
    local util = require 'lspconfig.util'
    local function get_typescript_server_path(root_dir)
      local global_ts = '~/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib'
      local found_ts = ''
      local function check_dir(path)
        found_ts = util.path.join(path, 'node_modules', 'typescript', 'lib')
        if util.path.exists(found_ts) then
          return path
        end
      end
      if util.search_ancestors(root_dir, check_dir) then
        return found_ts
      else
        return global_ts
      end
    end

    return {
      on_new_config = function(new_config, new_root_dir)
        new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
      end,
    }
  end,
  pyright = function()
    return {
      settings = {
        pyright = {
          -- Using Ruff's import organizer
          disableOrganizeImports = true,
        },
        python = {
          analysis = {
            -- Ignore all files for analysis to exclusively use Ruff for linting
            ignore = { '*' },
          },
        },
      },
    }
  end,
  rust_analyzer = function() return {} end,
  ruff = function()
    return {
      on_attach = function(client, bufnr)
        if client.name == 'ruff' then
          -- Disable hover in favor of Pyright
          client.server_capabilities.hoverProvider = false
        end
      end,
    }
  end,
  gopls = function() return {} end,
}

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
      for server, get_opts in pairs(servers) do
        lspconfig[server].setup(get_opts())
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
