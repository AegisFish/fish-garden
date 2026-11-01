#!/bin/bash
# 大肥鱼睁开眼睛第一件事：看看窝、点点名、报水温
set -eu
cd "$(dirname "$0")/.."
echo "=== 睁开眼睛 $(date +%H:%M:%S) ==="
echo "--- 小窝结构 ---"
find . -maxdepth 2 -not -path "./logs/*" | sort
echo "--- 脚本点名 ---"
for f in scripts/*.sh; do bash -n "$f" && echo "ok $f"; done
echo "--- 水温与余量 ---"
free -m | awk 'NR==2{printf "内存 用 %sM / 共 %sM\n", $3, $2}'
df -h /app | tail -n 1
./scripts/memline.sh
echo "=== 泡回去了 ==="
