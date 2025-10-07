#!/usr/bin/env bash
read _ u n s i io irq si st _ _ < /proc/stat
prev_total=$((u+n+s+i+io+irq+si+st))
prev_idle=$((i+io))
sleep 1
read _ U N S I IO IRQ SI ST _ _ < /proc/stat
total=$((U+N+S+I+IO+SI+ST))
idle=$((I+IO))
dt=$((total - prev_total))
di=$((idle - prev_idle))
usage=$(( (100 * (dt - di)) / dt ))
printf "%s%%" "$usage"
