#!/bin/sh
xrandr --output DVI-D-0 --mode 1920x1080 --pos 1080x840 --rotate normal --output HDMI-0 --off --output DP-0 --mode 1920x1080 --pos 0x0 --rotate left --output DP-1 --off
exec i3-msg restart
