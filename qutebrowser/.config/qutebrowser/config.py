config.load_autoconfig(True)
c.content.blocking.whitelist = ["http://sentry.os.mm.local/solaris"]
c.content.blocking.method = "both"

c.editor.command = ["alacritty", "--command", "nvim", "{file}", "-c", "normal {line}G{column0}l"]

config.bind(",m", "spawn mpv {url}")
config.bind(",M", "hint links spawn mpv {hint-url}")

# bitwarden auto-fill (v stands for vault)
config.bind(",vv", "spawn --userscript qute-bitwarden --auto-lock 300")
config.bind(",vp", "spawn --userscript qute-bitwarden --password-only --auto-lock 300")

nord = {
    "nord0": "#2e3440",
    "nord1": "#3b4252",
    "nord2": "#434c5e",
    "nord3": "#4c566a",
    "nord4": "#d8dee9",
    "nord5": "#e5e9f0",
    "nord6": "#eceff4",
    "nord7": "#8fbcbb",
    "nord8": "#88c0d0",
    "nord9": "#81a1c1",
    "nord10": "#5e81ac",
    "nord11": "#bf616a",
    "nord12": "#d08770",
    "nord13": "#ebcb8b",
    "nord14": "#a3be8c",
    "nord15": "#b48ead",
}

fg = nord['nord4']
bg = nord['nord1']
selected = nord['nord8']

c.colors.tabs.bar.bg = bg
c.colors.tabs.even.bg = bg
c.colors.tabs.even.fg = fg
c.colors.tabs.odd.bg = bg
c.colors.tabs.odd.fg = fg
c.colors.tabs.selected.even.bg = selected
c.colors.tabs.selected.even.fg = bg
c.colors.tabs.selected.odd.bg = selected
c.colors.tabs.selected.odd.fg = bg

c.colors.downloads.bar.bg = bg
c.colors.downloads.error.bg = nord['nord11']
c.colors.downloads.error.fg = bg
c.colors.downloads.start.bg = bg
c.colors.downloads.start.fg = fg
c.colors.downloads.stop.fg = bg
c.colors.downloads.stop.bg = nord['nord14']
