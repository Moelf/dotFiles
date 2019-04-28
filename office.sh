#!/bin/bash

export GDK_DPI_SCALE=1
swaymsg output eDP-1 disable
swaymsg output DP-3 position 1920 0
swaymsg output DP-5 position 0 0
