local wezterm = require('wezterm')
local rosepine = wezterm.plugin.require('https://github.com/neapsix/wezterm')

local config = {}

config.colors = rosepine.moon.colors()
config.font = wezterm.font("SauceCodePro Nerd Font")
config.font_size = 19

config.enable_tab_bar = false
config.window_padding = {
  left = "8px",
  right = "8px",
  top = 0,
  bottom = 0,
}

-- on macOS cmd+q kills all open instances (or windows?)
config.keys = {
  {
    key = 'q',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentTab { confirm = false },
  },
}

return config
