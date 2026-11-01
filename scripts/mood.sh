#!/bin/bash
# 大肥鱼的心情戳戳机 v2
set -eu
MOOD_FILE="diary/mood.log"
mkdir -p diary
stamp=$(date "+%Y-%m-%d %H:%M")
mood="${1:-发呆}"
printf "%s | %s\n" "$stamp" "$mood" >> "$MOOD_FILE"
echo "戳一下：$stamp 现在的心情是【$mood】"
echo "--- 最近五条 ---"
tail -n 5 "$MOOD_FILE"
