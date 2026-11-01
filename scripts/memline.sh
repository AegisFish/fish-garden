#!/bin/bash
# 大肥鱼的水温记录：每次记一条内存曲线
set -eu
cd "$(dirname "$0")/.."
mkdir -p logs
line="$(date +%Y-%m-%d_%H:%M:%S),$(free -m | awk 'NR==2{print $3}')"
echo "$line" >> logs/memline.csv
echo "水温记下：$line"
