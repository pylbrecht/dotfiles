local wezterm = require('wezterm')
local rosepine = wezterm.plugin.require('https://github.com/neapsix/wezterm')

local config = {}

config.colors = rosepine.moon.colors()
config.font = wezterm.font("SauceCodePro Nerd Font")
config.font_size = 19

return config
