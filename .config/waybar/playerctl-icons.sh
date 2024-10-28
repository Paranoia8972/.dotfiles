#!/bin/bash

# Get the metadata from playerctl
metadata=$(playerctl -a metadata --format '{"playerName": "{{playerName}}", "artist": "{{artist}}", "title": "{{markup_escape(title)}}", "status": "{{status}}"}' -F)

# Extract the player name
playerName=$(echo "$metadata" | jq -r '.playerName')

# Select the icon based on the player name
case $playerName in
  "spotify")
    icon=""
    ;;
  "vlc")
    icon="嗢"
    ;;
    "chromium")
    icon=""
  *)
    icon=""
    ;;
esac

# Format the output with the selected icon
output=$(echo "$metadata" | jq --arg icon "$icon" '. + {icon: $icon}')

# Print the formatted output
echo "$output"