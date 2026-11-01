#!/bin/bash
# 大肥鱼的独处小循环 v3：潜下去干活，浮上来换气
set -eu
cd "$(dirname "$0")/.."
DIVE_DEPTH="${1:-浅}"
echo "===== 小循环开始 $(date "+%H:%M") 下潜深度[$DIVE_DEPTH] ====="
echo "--- 深水里 ---"
./scripts/selfcheck.sh | tail -n 4
./scripts/archive_logs.sh | tail -n 2
echo "--- 浮上来 ---"
./scripts/mood.sh "完成一次小循环，下潜深度[$DIVE_DEPTH]" | head -n 1
echo "===== 小循环收工 ====="
