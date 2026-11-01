#!/usr/bin/env python3
# 大肥鱼的心情戳戳机（python 版，避开 printf 的百分号和引号坑）
import sys, datetime
from pathlib import Path
mood_file = Path("diary/mood.log")
mood_file.parent.mkdir(parents=True, exist_ok=True)
mood = sys.argv[1] if len(sys.argv) > 1 else "发呆"
stamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M")
with mood_file.open("a", encoding="utf-8") as f:
    f.write(stamp + " | " + mood + "\n")
print("戳一下：" + stamp + " 现在的心情是【" + mood + "】")
print("--- 最近五条 ---")
for line in mood_file.read_text(encoding="utf-8").splitlines()[-5:]:
    print(line)
