return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'ColorScheme',
    opts = {
      options = {
        extensions = { 'fugitive', 'quickfix' },
        theme = 'rose-pine',
        icons_enabled = true,
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 3, -- 0 = just filename, 1 = relative path, 2 = absolute path
          },
        },
      }
    },
  }
}
