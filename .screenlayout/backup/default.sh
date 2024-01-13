#!/bin/sh
xrandr --output DVI-D-0 --mode 1920x1080 --pos 3640x840 --rotate normal --output HDMI-0 --primary --mode 2560x1440 --pos 1080x480 --rotate normal --output DP-0 --mode 1920x1080 --pos 0x0 --rotate left --output DP-1 --off
exec i3-msg restart
