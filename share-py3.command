#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import webbrowser
import subprocess
import socket
import random
import sys
import os

script = 'tell application "Finder" to set thePath to (quoted form of POSIX path of (target of front window as alias))'
output = subprocess.check_output(['osascript', '-e', script])
path = output.decode('utf-8').strip().replace("'", "")

try:
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect(('8.8.8.8', 80))
    ip = s.getsockname()[0]
finally:
    s.close()
print(ip)

randomPort = random.randint(20000, 30000)
webbrowser.open('http://' + ip + ':' + str(randomPort))
os.chdir(path)
os.system('python3 -m http.server ' + str(randomPort))
# os.system('python -m SimpleHTTPServer ' + str(randomPort))


# 局域网互传神器
# webbrowser.open('http://baidu.com')
