#!/usr/bin/env bash
read -r _ total_kb _ < <(grep -m1 '^MemTotal:' /proc/meminfo)
read -r _ avail_kb _ < <(grep -m1 '^MemAvailable:' /proc/meminfo)

used_kb=$(( total_kb - avail_kb ))
awk -v k="$used_kb" 'BEGIN {
  used_bytes = k * 1024.0
  used_gb = used_bytes / 1e9
  printf("%.1fGB", used_gb)
}'
