import os
import subprocess

from typing import List  # noqa: F401

from libqtile import qtile, bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal, logger

alt = "mod1"
mod = "mod4"
terminal = guess_terminal()

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Execute App
    Key([mod], "p", lazy.spawn("rofi -show combi -combi-modi window,drun -sidebar-mode -modi 'run,ssh,filebrowser'"),
        desc="Run rofi luncher"),
    Key([alt], "Tab", lazy.spawn("rofi -show window"), desc="Switch window with rofi"),
]

if __name__ in ["config", "__main__"]:
    group_names = ["WWW", "DEV", "CHAT", "MUSIC"]
    group_keys = ["a", "s", "d", "f", "g"]
    groups = [
        Group("WWW", matches = [Match(wm_class=["google-chrome"])]),
        Group("DEV", matches = [Match(wm_class=["code"])]),
        Group("CHAT", matches = [Match(wm_class=["slack", "zoom"])]),
        Group("MUSIC"),
    ]
    for key, name in zip(group_keys, group_names):
        keys.append(Key([mod], key, lazy.group[name].toscreen()))
        keys.append(Key([mod, "shift"], key, lazy.window.togroup(name, switch_group=True)))

layouts = [
    layout.Columns(border_focus_stack='#d75f5f', num_columns=3, margin=[3,5,3,5], margin_on_single = 7),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=3),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

gruvbox_colors = dict(
    bg = ["#282828", "#282828"],
    red = ["#cc2d1d", "#cc2d1d"],
    green = ["#98971a", "#98971a"],
    yellow = ["#d79921", "#d79921"],
    blue = ["#458588", "#458588"],
    purple = ["#b16286", "#b16286"],
    aqua = ["#689d6a", "#689d6a"],
    gray = ["#a89984", "#a89984"],
    fg = ["#ebdbb2", "#ebdbb2"],
)

widget_defaults = dict(
    font='Hack Nerd Font',
    fontsize=18,
    padding=3,
    background = gruvbox_colors["bg"],
    foreground = gruvbox_colors["fg"],
)
extension_defaults = widget_defaults.copy()
separeter_padding = 15
separeter_foreground = gruvbox_colors["green"]

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Spacer(length = int(separeter_padding/2)),
                widget.Image(
                    filename='~/.config/qtile/icon/archlinux.ico',
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn('rofi -show drun')}
                    #mouse_callbacks = {'Button1': lambda: logger.error("mouse callback")}
                ),
                widget.Sep(padding=separeter_padding, foreground=separeter_foreground),
                widget.GroupBox(
                        borderwidth = 3,
                    active = gruvbox_colors["fg"],
                    inactive = gruvbox_colors["gray"],
                    highlight_method = "line",
                    highlight_color = gruvbox_colors["aqua"],
                    disable_drag = "True",
                ),
                widget.Sep(padding=separeter_padding, foreground=separeter_foreground),
                widget.Spacer(),
                widget.WindowName(),
                widget.Spacer(),
                widget.Sep(padding=separeter_padding, foreground=separeter_foreground),
                widget.Systray(),
                widget.Sep(padding=separeter_padding, foreground=separeter_foreground),
                widget.PulseVolume(fmt='🔊 {}'),
                widget.Sep(padding=separeter_padding, foreground=separeter_foreground),
                widget.CheckUpdates(
                    foreground = gruvbox_colors["fg"],
                    colour_no_updates = gruvbox_colors["fg"],
                    display_format = "📦 {updates}",
                    no_update_string='📦 0',
                    update_interval = 180,
                    distro = "Arch_paru",
                ),
                widget.Sep(padding=separeter_padding, foreground=separeter_foreground),
                widget.CPU(),
                widget.ThermalSensor(
                    foreground = gruvbox_colors["fg"],
                    tag_sensor="Tdie",
                ),
                widget.Sep(padding=separeter_padding, foreground=separeter_foreground),
                widget.Memory(
                    format = 'MEM {MemUsed:.1f}{mm}/{MemTotal:.1f}{mm}',
                    measure_mem = 'G'
                ),
                widget.Sep(padding=separeter_padding, foreground=separeter_foreground),
                widget.NvidiaSensors(
                    foreground = gruvbox_colors["fg"],
                    format = 'GPU {temp}°C',
                ),
                widget.Sep(padding=separeter_padding, foreground=separeter_foreground),
                widget.Clock(format='%Y-%m-%d %a %H:%M'),
            ],
            26,
            margin = [10, 10, 5, 10],
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])
    subprocess.Popen("slack")
    subprocess.Popen(["1password", "--silent"])
    set_wallpaper()

def set_wallpaper():
    logger.info("change wallpaper...")
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/wallpaper.py'])

@hook.subscribe.setgroup
def group_set():
    set_wallpaper()

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
wmname = "LG3D"
