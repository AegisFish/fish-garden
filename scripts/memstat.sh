#!/bin/bash
# 大肥鱼的水温统计：看自己长胖了多少
set -eu
cd "$(dirname "$0")/.."
f=logs/memline.csv
[ -s "$f" ] || { echo '水温线还空着'; exit 0; }
n=$(wc -l < "$f")
first=$(head -n 1 "$f")
last=$(tail -n 1 "$f")
vals=$(cut -d, -f2 "$f")
min=$(echo "$vals" | sort -n | head -n 1)
max=$(echo "$vals" | sort -n | tail -n 1)
sum=$(echo "$vals" | awk '{s+=$1} END{print s}')
avg=$((sum / n))
echo "水温线 $n 条 | 最瘦 ${min}M / 最胖 ${max}M / 平均 ${avg}M"
echo "起步 $first"
echo "最新 $last"
