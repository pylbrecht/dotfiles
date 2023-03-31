config.load_autoconfig(True)
c.content.blocking.whitelist = ["http://sentry.os.mm.local/solaris"]
c.content.blocking.method = "both"

c.editor.command = ["alacritty", "--command", "nvim", "{file}", "-c", "normal {line}G{column0}l"]
c.tabs.padding = {'bottom': 4, 'left': 5, 'right': 5, 'top': 4}
c.tabs.indicator.padding = {'bottom': 0, 'left': 0, 'right': 4, 'top': 0}
c.tabs.select_on_remove = 'last-used'
c.tabs.title.format = '{audio}{relative_index}: {current_title}'
c.tabs.max_width = 500

c.fonts.default_family = "SauceCodePro Nerd Font"
c.fonts.default_size = "15px"
c.fonts.tabs.selected = '17px SauceCodePro Nerd Font'
c.fonts.tabs.unselected = '17px SauceCodePro Nerd Font'

config.bind(",m", "spawn mpv {url}")
config.bind(",M", "hint links spawn mpv {hint-url}")

# bitwarden auto-fill (v stands for vault)
config.bind(",vv", "spawn --userscript qute-bitwarden --auto-lock 300")
config.bind(",vp", "spawn --userscript qute-bitwarden --password-only --auto-lock 300")

# nord theme
config.source(str(config.configdir / 'themes/nord/nord-qutebrowser.py'))
