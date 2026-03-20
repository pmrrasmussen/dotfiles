#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected="$1"
else
    selected=$(
        {
            tmux list-sessions -F '#S' 2>/dev/null
            find ~/ -mindepth 1 -maxdepth 1 -type d
        } | awk '!seen[$0]++' | fzf
    )
fi

if [[ -z $selected ]]; then
    exit 0
fi

tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s "$selected" -c "$HOME/$selected"
    exit 0
fi

if ! tmux has-session -t="$selected" 2>/dev/null; then
    tmux new-session -ds "$selected" -c "$HOME/$selected"
fi

tmux switch-client -t "$selected"
