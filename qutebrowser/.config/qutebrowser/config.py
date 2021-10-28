config.load_autoconfig(True)
c.content.blocking.whitelist = ["http://sentry.os.mm.local/solaris"]
c.content.blocking.method = "both"

config.bind(",m", "spawn mpv {url}")
config.bind(",M", "hint links spawn mpv {hint-url}")
