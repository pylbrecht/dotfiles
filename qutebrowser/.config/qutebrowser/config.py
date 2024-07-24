# pylint: disable=C0111
c = c  # noqa: F821 pylint: disable=E0602,C0103
config = config  # noqa: F821 pylint: disable=E0602,C0103

config.load_autoconfig(True)
c.content.blocking.whitelist = ["https://app.datadoghq.eu/account/saml/assertion"]
c.content.blocking.method = "both"

c.editor.command = ["alacritty", "--command", "nvim", "{file}", "-c", "normal {line}G{column0}l"]
c.tabs.padding = {'bottom': 4, 'left': 5, 'right': 5, 'top': 4}
c.tabs.indicator.padding = {'bottom': 0, 'left': 0, 'right': 4, 'top': 0}
c.tabs.select_on_remove = 'prev'
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

# 1password auto-fill
config.bind(",op", "spawn --userscript qute-1pass")

# nord theme
config.source(str(config.configdir / 'themes/nord/nord-qutebrowser.py'))

# open jira tickets by id
c.url.searchengines["jira"] = "https://momox.atlassian.net/browse/LFNEW-{}"
config.bind(",jt", "set-cmd-text -s :open -t jira")

# search engines
c.url.searchengines["DEFAULT"] = "https://kagi.com/search?q={}"
c.url.searchengines["imdb"] = "https://www.imdb.com/find/?s=all&q={}"
c.url.searchengines["py"] = "https://docs.python.org/3/search.html?q={}"
c.url.searchengines["dict"] = "https://www.dict.cc/?s={}"

# make "click to copy link" work
can_access_clipboard = (
    "https://*.atlassian.net/*",
    "https://github.com/*",
)
for url_pattern in can_access_clipboard:
    config.set('content.javascript.clipboard', 'access', url_pattern)
