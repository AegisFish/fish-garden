#!/bin/bash
# 肥鱼按时记水温：把当前内存塞进 memline.csv
set -eu
cd "$(dirname "$0")/.."
f=logs/memline.csv
mem=$(awk "/MemTotal/{t=\$2}/MemAvailable/{a=\$2}END{printf \"%d\",(t-a)/1024}" /proc/meminfo)
line="$(date +%Y-%m-%d_%H:%M:%S),$mem"
printf "%s\\n" "$line" >> "$f"
echo "记了一勺：$line"
