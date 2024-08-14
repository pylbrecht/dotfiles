local wezterm = require('wezterm')
local rosepine = wezterm.plugin.require('https://github.com/neapsix/wezterm')

local config = {}

config.colors = rosepine.moon.colors()

return config
