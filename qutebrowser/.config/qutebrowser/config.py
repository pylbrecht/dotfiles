config.load_autoconfig(True)
c.content.blocking.whitelist = ["http://sentry.os.mm.local/solaris"]
c.content.blocking.method = "both"

c.editor.command = ["alacritty", "--command", "nvim", "{file}", "-c", "normal {line}G{column0}l"]

config.bind(",m", "spawn mpv {url}")
config.bind(",M", "hint links spawn mpv {hint-url}")
config.bind(",v", "spawn --userscript qute-bitwarden")  # v for vault
