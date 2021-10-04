#!/bin/bash

# Terminate already running bar instance
killall -q polybar

# Wait until teh processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch Polybar using default config location ~/.config/polybar/config
polybar example &

echo "Polybar launched..."

