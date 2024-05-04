-- Setup language servers.
local lspconfig = require('lspconfig')
vim.lsp.set_log_level("debug")

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
    found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
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
lspconfig.volar.setup{
  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
  end,
}

lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.ruff_lsp.setup {}

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

    local fzf = require('fzf-lua')
    vim.keymap.set("n", "gd", function() fzf.lsp_definitions({jump_to_single_result = true}) end, {silent = true})
    vim.keymap.set("n", "gD", function() fzf.lsp_definitions({
      jump_to_single_result = true,
      jump_to_single_result_action = require('fzf-lua.actions').file_vsplit
    }) end, {silent = true})
    vim.keymap.set("n", "gr", function() fzf.lsp_references({
      ignore_current_line = true,
      includeDeclaration = false
    }) end, {silent = true})
    vim.keymap.set("n", "gi", fzf.lsp_implementations, {silent = true})

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
  end,
})

-- General mappings
vim.keymap.set("n", "<leader>lr", ":LspRestart<cr>", {silent = true})

-- Navigate diagnostics
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { noremap = true, silent = true })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true })
