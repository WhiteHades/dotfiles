#!/usr/bin/env bash
set -euo pipefail

INTERNAL="eDP-1"

# Count monitors that are not the internal panel
HAS_EXTERNAL="$(hyprctl monitors -j | jq -r '[.[] | select(.name != "'"$INTERNAL"'")] | length')"

case "${1:-}" in
  close)
    if [ "${HAS_EXTERNAL}" -gt 0 ]; then
      # remove internal panel from layout; windows/workspaces move to remaining monitors
      hyprctl keyword monitor "${INTERNAL}, disable"
    fi
    ;;
  open)
    # bring it back with your current scale
    hyprctl keyword monitor "${INTERNAL}, preferred, auto, 1.5"
    ;;
esac
