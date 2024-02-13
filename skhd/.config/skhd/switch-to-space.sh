#!/usr/bin/env bash
#
# Emulate i3wm's workspace switching behavior.
# (https://i3wm.org/docs/userguide.html#workspace_auto_back_and_forth)

RECENT_SPACE_FILE="/tmp/yabai-recent-space-index"
ACTIVE_SPACE=$(yabai -m query --spaces --display | jq '.[] | select(."has-focus" == true).index')

if [ ! -f "$RECENT_SPACE_FILE" ]; then
	RECENT_SPACE=$ACTIVE_SPACE
else
	RECENT_SPACE=$(cat "$RECENT_SPACE_FILE")
fi

if [ "$ACTIVE_SPACE" == $1 ]; then
	skhd -k "ctrl - $(($RECENT_SPACE % 10))"
else
	skhd -k "ctrl - $(($1 % 10))"
fi

echo $ACTIVE_SPACE > "$RECENT_SPACE_FILE"
