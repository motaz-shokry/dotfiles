#!/usr/bin/env bash

ICON_SCREENSHOT="$HOME/.local/share/icons/custom/gruvbox-pack/screenshot.png"

case "$1" in
	area)
		slurp -b 00000080 -c 00000080 | grim -t jpeg -q 100 -g - - | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png |  wl-copy --type image/png
		notify-send -r 999 -i "$ICON_SCREENSHOT" "Screenshot copied to clipboard"
		;;
	window)
		active_window="$(hyprctl activewindow -j |  jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')"
		grim -g "$active_window" -t jpeg -q 100 - | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png | wl-copy --type image/png
		notify-send -r 999 -i "$ICON_SCREENSHOT" "Screenshot copied to clipboard"
		;;
	screen)
		grim -t jpeg -q 100 - | satty --filename - --fullscreen --output-filename ~/Pictures/Screenshots/satty-$(date '+%Y%m%d-%H:%M:%S').png | wl-copy --type image/png
		notify-send -r 999 -i "$ICON_SCREENSHOT" "Screenshot copied to clipboard"
		;;
esac

