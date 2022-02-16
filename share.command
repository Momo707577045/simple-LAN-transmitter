#!/usr/bin/env python
# -*- coding: utf-8 -*-
import webbrowser
import socket
import random
import sys
import os

try:
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect(('8.8.8.8', 80))
    ip = s.getsockname()[0]
finally:
    s.close()
print(ip)

randomPort = random.randint(20000, 30000)
webbrowser.open('http://' + ip + ':' + str(randomPort))
os.chdir(sys.path[0])
os.system('python -m SimpleHTTPServer ' + str(randomPort))
# os.system('python -m SimpleHTTPServer ' + str(randomPort))


# 局域网互传神器
# webbrowser.open('http://baidu.com')
