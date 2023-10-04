#!/usr/bin/env bash
#
# Emulate i3wm's workspace switching behavior.
# (https://i3wm.org/docs/userguide.html#workspace_auto_back_and_forth)

RECENT_SPACE_FILE="/tmp/yabai-recent-space-index"

ACTIVE_SPACE=$(yabai -m query --spaces --display | jq '.[] | select(."has-focus" == true).index')

if [ -f "${RECENT_SPACE_FILE}" ]; then
	RECENT_SPACE=$(cat ${RECENT_SPACE_FILE})
else
	RECENT_SPACE=${ACTIVE_SPACE}
fi

echo $RECENT_SPACE > ${RECENT_SPACE_FILE}

if [ "$ACTIVE_SPACE" == $1 ]; then
	skhd -k "ctrl - ${RECENT_SPACE}"
else
	skhd -k "ctrl - $1"
fi
