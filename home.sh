#!/bin/bash
if swaymsg -t get_outputs | grep eDP-1 -A 1 | grep false -q; then
    swaymsg output eDP-1 enable
else
    swaymsg output eDP-1 disable
fi
# swaymsg output DP-2 position 0 0
# swaymsg output DP-2 scale 1
# swaymsg output eDP-1 position 200 2160
