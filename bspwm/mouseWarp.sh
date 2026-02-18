#!/bin/bash

bspc subscribe monitor_focus | while read -r _ id; do
    name=$(bspc query -M -m "$id" --names)
    eval $(xdotool getmouselocation --shell)

    case "$name" in
    "DP-0")
        [ "$X" -lt 1440 ] && xdotool mousemove 2400 1670
        ;;

    "HDMI-0_BOT")
        # Warp to the large 2/3 section (now at the bottom)
        # Center of 1440x1700 starting at Y=860 -> Y = 860 + 850 = 1710
        [ "$X" -ge 1440 ] && xdotool mousemove 720 1710
        ;;

    "HDMI-0_TOP")
        # No warp for the small system slice at the top
        :
        ;;
    esac
done
