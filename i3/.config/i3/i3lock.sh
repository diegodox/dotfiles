#!/usr/bin/env bash

## i3lock with background image

# use argument as image file path or use default image
IMAGE="${1:-"$HOME/.wallpaper/share_bg/archlinux/archwave.png"}"
SCREEN_RESOLUTION="$(xdpyinfo | grep dimensions | cut -d' ' -f7)"

# force resize to screen resolution
# set output file stdout formatted as RGB
convert "$IMAGE" \
    -gravity Center \
    -resize "($SCREEN_RESOLUTION)!" \
    RGB:- \
    | i3lock --raw "$SCREEN_RESOLUTION":rgb -i /dev/stdin
