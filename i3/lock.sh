#!/bin/bash
set -e
sleep 1
xset -display :0.0 dpms force off
i3lock --ignore-empty-password --show-failed-attempts --nofork -i ~/Pictures/aurora.png
