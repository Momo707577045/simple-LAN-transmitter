#!/bin/bash

# 使用AppleScript获取当前打开的目录
thePath=$(osascript -e 'tell application "Finder" to set thePath to (quoted form of POSIX path of (target of front window as alias))')

# 去除路径中的引号
thePath=${thePath//\'/}

# 获取 20000 到 30000 之间的随机整数
get_random_port() {
  local min=20000
  local max=30000
  local range=$(($max-$min+1))
  echo $(($RANDOM % $range + $min))
}

randomPort=$(get_random_port)

# 检测是否安装了 Python 3
if command -v python3 &>/dev/null; then
  # 如果已经安装了 Python 3，则使用 Python 3 启动 HTTP 服务器
  python_script='
import socket
import random
import sys
import os

try:
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect(("8.8.8.8", 80))
    ip = s.getsockname()[0]
finally:
    s.close()
print(ip)
print("http://" + ip + ":" + str('${randomPort}'))
os.chdir("'${thePath}'")
os.system("python3 -m http.server " + str('${randomPort}'))
'
# 启动 HTTP 服务器
echo "$python_script" | python3 &
pid=$!


else
  # 如果未安装 Python 3，则使用 Python 2 启动 HTTP 服务器
  python_script='
import socket
import random
import sys
import os

try:
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect(("8.8.8.8", 80))
    ip = s.getsockname()[0]
finally:
    s.close()
print(ip)
print("http://" + ip + ":" + str('${randomPort}'))
os.chdir("'${thePath}'")
os.system("python -m SimpleHTTPServer " + str('${randomPort}'))
'
# 启动 HTTP 服务器
echo "$python_script" | python &
pid=$!
fi

# 等待 HTTP 服务器启动，并打开浏览器访问网址
open "http://localhost:$randomPort"

# 记录 PID，以便在脚本结束时杀死进程
echo $pid > /tmp/http_server.pid

# 等待用户按下 Ctrl+C，或者直到 HTTP 服务器关闭
trap 'kill -9 $pid && rm /tmp/http_server.pid' SIGINT SIGTERM
wait $pid