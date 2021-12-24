#!/bin/bash

# Terminate already running bar instance
killall -q polybar

# Wait until teh processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch Polybar using default config location ~/.config/polybar/config
polybar main &

# Subscribe i3wm ipc to hook i3layout module update
i3-msg -t subscribe -m '[ "workspace", "output", "window", "binding" ]' | while read line ; do polybar-msg hook i3layout 1 && sleep 0.2; done &

echo "Polybar launched..."

