#!/bin/bash
xrandr | grep -q 3440 && xrandr --output eDP-1 --off
feh --bg-scale '/home/stbenjam/Pictures/aurora.png'

