# Helper funciton to write chained keybinding.
def bind_chained(key, *commands):
    config.bind(key, ' ;; '.join(commands))

# Disable `d`(close tab) to prevent unintentional closing of tab, use `<Ctrl-w>` instead.
config.bind('d', 'nop')

# Toggle tab/status bar
config.bind('<Ctrl+b>', 'config-cycle tabs.show always never')
config.bind('xs', 'config-cycle statusbar.show always in-mode')

# Vim like tab/history navigation
config.bind('<Ctrl+h>', 'back')
config.bind('<Ctrl+j>', 'tab-next')
config.bind('<Ctrl+k>', 'tab-prev')
config.bind('<Ctrl+l>', 'forward')

# Chrome-like keybindings
config.bind('<Ctrl+n>', 'open -t')
config.bind('<Ctrl+o>', 'set-cmd-text -s :open -t ')
config.bind('<Ctrl+s>', 'set-cmd-text -s :search')
config.bind('<Ctrl+f>', 'hint all tab')

# Open MPV
config.bind('<Shift+m>', 'spawn mpv {url}')
config.bind('<Ctrl+m>', 'hint links spawn mpv {hint-url}')

