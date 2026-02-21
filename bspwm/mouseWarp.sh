#!/bin/bash

bspc subscribe monitor_focus | while read -r _ id; do
    name=$(bspc query -M -m "$id" --names)
    eval $(xdotool getmouselocation --shell)
    case "$name" in
    "DP-0")
        [ "$X" -lt 1440 ] && xdotool mousemove 2400 1670
        ;;
    "HDMI-0_BOT")
        [ "$X" -ge 1440 ] && xdotool mousemove 720 1710
        ;;
    "HDMI-0_TOP")
        :
        ;;
    esac
    # xbanish &
done
