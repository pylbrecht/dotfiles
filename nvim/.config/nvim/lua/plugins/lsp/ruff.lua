return {
  root_markers = {
    'pyproject.toml',
    -- We have multiple ruff.toml files in the project, which leads to ruff attaching multiple times
    -- 'ruff.toml',
    '.ruff.toml',
    '.git'
  },
  on_attach = function(client, bufnr)
    if client.name == 'ruff' then
      -- Disable hover in favor of Pyright
      client.server_capabilities.hoverProvider = false
    end
  end,
}
