#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# echo "---" | tee -a /tmp/polybar_top.log
# polybar top 2>&1 | tee -a /tmp/polybar_top.log & disown

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar --reload top 2>&1 | tee -a /tmp/polybar_top_$m.log & disown
    disown
    MONITOR=$m polybar --reload top-dummy 2>&1 | tee -a /tmp/polybar_top_dummy_$m.log & disown
    disown
done

echo "Bars launched..."
