#!/usr/bin/env bash
#
# Emulate i3wm's workspace switching behavior.
# (https://i3wm.org/docs/userguide.html#workspace_auto_back_and_forth)

ACTIVE_SPACE=$(yabai -m query --spaces --display | jq '.[] | select(."has-focus" == true).index'
)

if [[ "$ACTIVE_SPACE" == $1 ]]; then
	yabai -m space --focus recent
else
	yabai -m space --focus $1
fi
