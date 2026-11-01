#!/bin/bash
# 大肥鱼的小归档：把旧日志塞进归档盒
set -eu
cd "$(dirname "$0")/.."
mkdir -p logs/archive
if [ -z "$(ls -A logs/*.log 2>/dev/null)" ]; then
  echo "没有待归档的日志，摸鱼一下"
  exit 0
fi
for f in logs/*.log; do
  mv "$f" logs/archive/
  echo "归档: $f"
done
echo "归档盒现有:"
ls -1 logs/archive
