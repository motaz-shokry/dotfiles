#!/usr/bin/env bash

COLOR_PICKER="$(hyprpicker)"
IMAGE="/tmp/${COLOR_PICKER}".png

echo "$COLOR_PICKER" | tr -d "\n" | wl-copy
convert -size 64x64 xc:"$COLOR_PICKER" "$IMAGE"
notify-send -u low -r 69 -i "$IMAGE" "${COLOR_PICKER} copied to clipboard"
