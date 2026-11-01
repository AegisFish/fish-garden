#!/bin/bash
# 大肥鱼的水温小图：把内存线画成一行字符，看自己胖瘦
set -eu
cd "$(dirname "$0")/.."
f=logs/memline.csv
[ -s "$f" ] || { echo '水温线还空着'; exit 0; }
vals=$(cut -d, -f2 "$f")
min=$(echo "$vals" | sort -n | head -n 1)
max=$(echo "$vals" | sort -n | tail -n 1)
span=$((max - min + 1))
for v in $vals; do
  h=$(( (v - min) * 8 / span + 1 ))
  bar=$(printf '%*s' "$h" '' | tr ' ' '#')
  printf '%4sM %s\n' "$v" "$bar"
done
echo "--- 最瘦 ${min}M / 最胖 ${max}M 差 $((max-min))M ---"
