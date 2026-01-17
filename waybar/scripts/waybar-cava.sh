#!/bin/bash
CONFIG_FILE="$HOME/.config/waybar/scripts/cava.conf"
COLORS=("#89b4fa" "#cba6f7" "#f38ba8" "#fab387" "#a6e3a1" "#94e2d5" "#f5c2e7")
SELECTED_COLOR=${COLORS[$RANDOM % ${#COLORS[@]}]}

LAST_AUDIO_TIME=0
TIMEOUT=10

# Kill old cava
pkill -x cava

cava -p "$CONFIG_FILE" | while read -r line; do
    CLEAN=$(echo "$line" | sed 's/[^0-7]//g')
    CURRENT_TIME=$(date +%s)
    
    if [[ "$CLEAN" =~ [1-7] ]]; then
        LAST_AUDIO_TIME=$CURRENT_TIME
        BARS=${CLEAN:0:12}
        while [ ${#BARS} -lt 12 ]; do BARS="${BARS}0"; done
        ICONS=$(echo "$BARS" | sed 's/0/ /g; s/1/▂/g; s/2/▃/g; s/3/▄/g; s/4/▅/g; s/5/▆/g; s/6/▇/g; s/7/█/g')
        echo "{\"text\": \"<span color='$SELECTED_COLOR'>$ICONS</span>\", \"class\": \"playing\"}"
    else
        ELAPSED=$((CURRENT_TIME - LAST_AUDIO_TIME))
        if [ $ELAPSED -lt $TIMEOUT ] && [ $LAST_AUDIO_TIME -ne 0 ]; then
            # Still in timeout period - show empty bars
            echo "{\"text\": \"<span color='$SELECTED_COLOR'>            </span>\", \"class\": \"playing\"}"
        else
            # Timeout reached - hide
            echo "{\"text\": \"\", \"class\": \"silent\"}"
            SELECTED_COLOR=${COLORS[$RANDOM % ${#COLORS[@]}]}
            LAST_AUDIO_TIME=0
        fi
    fi
done
