#!/bin/bash
NEW_XAUTH=$(ls -t /run/user/1000/xauth_* 2>/dev/null | head -1) # adjust glob for CachyOS/bspwm
# or: NEW_XAUTH="$HOME/.Xauthority"

tmux setenv -g XAUTHORITY "$NEW_XAUTH"
tmux list-panes -a -F '#{pane_id}' | while read pane; do
    tmux send-keys -t "$pane" " export XAUTHORITY='$NEW_XAUTH'" Enter
done
