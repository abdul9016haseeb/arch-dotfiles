#!/bin/bash

FILE=~/Pictures/Screenshots/screenshot-$(date +%Y%m%d-%H%M%S).png

flash() {
    hyprctl keyword general:col.active_border "rgba(ffffffff)"
    sleep 0.15
    hyprctl keyword general:col.active_border "rgba(33ccffee) rgba(00ff99ee) 45deg"
}

if [ "$1" = "region" ]; then
    REGION=$(slurp)
    [ -z "$REGION" ] && exit  # cancelled by user
    grim -g "$REGION" "$FILE"
    flash
    dunstify -I "$FILE" "Screenshot" "Region saved"
else
    grim "$FILE"
    flash
    dunstify -I "$FILE" "Screenshot" "Full screen saved"
fi
