#!/bin/bash

# Force LC_ALL to prevent locale-related output quirks
export LC_ALL=C

# Safely get status without playerctl printing errors
status=$(playerctl --player=spotifyd status 2>/dev/null)

# If playerctl gives no output (i.e. spotifyd not running)
if [[ -z "$status" ]]; then
    echo '{"text": "", "tooltip": "", "class": "custom-spotify"}'
    exit 0
fi

# If playing or paused, get metadata
if [[ "$status" == "Playing" || "$status" == "Paused" ]]; then
    artist=$(playerctl --player=spotifyd metadata artist 2>/dev/null | sed 's/"/\\"/g')
    title=$(playerctl --player=spotifyd metadata title 2>/dev/null | sed 's/"/\\"/g')
    icon=""

    # Print clean JSON
    echo "{\"text\": \"$icon   $title - $artist\", \"tooltip\": \"$artist - $title\", \"class\": \"custom-spotify\"}"
else
    echo '{"text": "", "tooltip": "", "class": "custom-spotify"}'
fi
