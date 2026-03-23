#!/usr/bin/env zsh

if [[ $# -eq 1 ]]; then
    selected_path="$1"
else
    selected_path=$(
        {
            tmux list-sessions -F '#S' 2>/dev/null
            find ~/ -mindepth 1 -maxdepth 1 -type d
        } | awk '!seen[$0]++' | fzf --height 10
    )
fi
if [[ -z $selected_path ]]; then
    exit 0
fi

selected_name=$(basename "$selected_path")
tmux_running=$(pgrep tmux)

if [[ -z $tmux_running ]]; then
    tmux new-session -s "$selected_name" -c "$selected_path"
fi
if ! tmux has-session -t="$selected_name" 2>/dev/null; then
    tmux new-session -ds "$selected_name" -c "$selected_path"
fi

if [[ -n $TMUX ]]; then
    tmux switch-client -t "$selected_name"
else
    tmux attach-session -t "$selected_name"
fi
