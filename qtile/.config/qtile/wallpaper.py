#!/usr/bin/env python3

import os
import subprocess

from libqtile.command.client import InteractiveCommandClient

def current_group_name():
    return InteractiveCommandClient().group.info()["name"]

def set_wallpaper():
    wallpaper_dir = (f"{os.path.expanduser('~')}/.wallpaper")
    is_wallpaper_set = False
    wallpaper = ""
    group_name = current_group_name()
    if group_name == "WWW":
        is_wallpaper_set = True
        wallpaper = "share_bg/archlinux/wild.png"
    elif group_name == "DEV":
        is_wallpaper_set = True
        wallpaper = "share_bg/archlinux/archbtw.png"
    elif group_name == "CHAT":
        is_wallpaper_set = True
        wallpaper = "share_bg/archlinux/awesome.png"
    elif group_name == "MUSIC":
        is_wallpaper_set = True
        wallpaper = "share_bg/archlinux/mountain.jpg"

    cmd = (f"/usr/bin/feh --bg-fill --randomize --no-xinerama --recursive --no-fehbg {wallpaper_dir}")
    if is_wallpaper_set:
        cmd = (f"/usr/bin/feh --bg-fill --no-fehbg -N --no-xinerama --no-screen-clip --quiet {wallpaper_dir}/{wallpaper}")
    return subprocess.run(cmd, shell=True)

if __name__ == '__main__':
    set_wallpaper()
