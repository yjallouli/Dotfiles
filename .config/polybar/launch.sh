#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch the bar
MONITOR=eDP1 polybar top &
MONITOR=HDMI2 polybar top &
echo "Bars launched..."
