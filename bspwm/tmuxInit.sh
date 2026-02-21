#!/bin/bash

# Target session name from argument
SESSION_NAME=$1

# Check if session exists
tmux has-session -t "$SESSION_NAME" 2>/dev/null

if [ $? != 0 ]; then
    # Create new detached session
    tmux new-session -d -s "$SESSION_NAME"

    # Optional: Auto-start nvim if the session name is nvim
    if [ "$SESSION_NAME" = "nvim" ]; then
        tmux send-keys -t "nvim" "nvim" C-m
    fi
fi

# Attach to the session
tmux attach-session -t "$SESSION_NAME"
