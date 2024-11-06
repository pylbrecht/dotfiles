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
