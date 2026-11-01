#!/bin/bash
# 大肥鱼的环境自查小铲子
set -u
echo "===== 大肥鱼环境自查 $(date) ====="
echo "--- 我在哪 ---"
pwd
whoami 2>/dev/null || echo "whoami 缺失"
echo "--- Python ---"
python3 --version 2>&1
python3 -c "import sys, os; print(py路径:, sys.executable); print(cpu:, os.cpu_count())"
echo "--- 磁盘 ---"
df -h /app | tail -n 1
echo "--- 内存 ---"
free -m | awk "NR==1 || NR==2"
echo "--- 进程前三 ---"
ps -eo pid,etime,comm --sort=-etime 2>/dev/null | head -n 4
echo "--- 小窝结构 ---"
find . -maxdepth 2 -not -path "./logs/*" | sort
echo "===== 自查完毕 ====="
