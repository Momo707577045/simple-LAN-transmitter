![](http://upyun.luckly-mjw.cn/Assets/lan-transmitter/011.png)
# 极致的局域网传输体验应该是怎么样的
*仅需一步，双击软件启动分享，无需部署，无需配置，接近于零的学习成本*
- 打开要分享的文件夹
- 双击进行分享（启动分享，仅需要双击运行）
- 将分享链接发送给小伙伴
- 小伙伴通过链接下载需要的文件
- 关闭分享

# 为什么是它

![](http://upyun.luckly-mjw.cn/Assets/lan-transmitter/012.png)
- 简单：
  - 无需安装，单个文件，双击运行程序即可分享，无需部署，无需配置
  - 程序小于 100k，随用随时下载，随时运行
- 快速
  - 基于局域网传输，不使用外网宽带，不耗费流量
  - 点对点直接传输，不需要经过先上传，再下载的过程
- 安全
  - 基于局域网传输，无任何中间商，数据不会在任何第三方中存储，杜绝信息泄露

# windows 端使用说明
- [下载局域网分享器](http://upyun.luckly-mjw.cn/Assets/lan-transmitter/webd.exe)
  ![](http://upyun.luckly-mjw.cn/Assets/lan-transmitter/017.png)
- 将「分享器」放在想要分享的文件夹中，如果想要分享桌面的文件，那将「分享器」放在桌面即可
  ![](http://upyun.luckly-mjw.cn/Assets/lan-transmitter/007.png)
- 双击「分享器」

  ![](http://upyun.luckly-mjw.cn/Assets/lan-transmitter/008.png)
- 右键「分享器」，点击打开分享页面，在浏览器打开你正在分享的文件夹页面

  ![](http://upyun.luckly-mjw.cn/Assets/lan-transmitter/009.png)
- 复制该链接，发送给小伙伴，小伙伴访问该链接将得到相同的页面
  ![](http://upyun.luckly-mjw.cn/Assets/lan-transmitter/010.png)
- 点击页面中的链接，即可下载该文件。如果是媒体文件，浏览器会打开预览功能，可以 ctrl + s 对文件进行保存
- 原理：
  - 由于本人对 windows 开发并不熟悉，在 windows 端能找到最相识，最简单的工具就这个了。
  - 未找到该工具的作者信息，在此只能默念表示感谢了。

# mac 端使用说明
- 点击[下载局域网分享器](http://upyun.luckly-mjw.cn/Assets/lan-transmitter/share.sh)，得到「分享器」文件

  ![](http://upyun.luckly-mjw.cn/Assets/lan-transmitter/001.png)
- 将「分享器」放在想要分享的文件夹中，如果想要分享桌面的文件，那将「分享器」放在桌面即可
  ![](http://upyun.luckly-mjw.cn/Assets/lan-transmitter/002.png)
- 双击运行「分享器」

  ![](http://upyun.luckly-mjw.cn/Assets/lan-transmitter/003.png)
- 「分享器」将自动在浏览器打开你正在分享的文件夹页面
- 复制该链接，发送给小伙伴，小伙伴访问该链接将得到相同的页面
  ![](http://upyun.luckly-mjw.cn/Assets/lan-transmitter/004.png)
- 点击页面中的链接，即可下载该文件。如果是媒体文件，浏览器会打开预览功能，可以 ctrl + s 对文件进行保存
- 局域网的传输速度较快，一般情况下可以达到 3m/s，实现大文件的快速传输
  ![](http://upyun.luckly-mjw.cn/Assets/lan-transmitter/005.png)
  ![](http://upyun.luckly-mjw.cn/Assets/lan-transmitter/006.png)
- 原理：这是一个简单的 python 脚本，借助 python 快速搭建服务器的命令`SimpleHTTPServer`。mac 系统内置有 python，无需提前安装，故没有前置环境要求。
```
#!/usr/bin/env python
# -*- coding: utf-8 -*-
import webbrowser
import socket
import random
import sys
import os

# 获取本机 ip
try:
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect(('8.8.8.8', 80))
    ip = s.getsockname()[0]
finally:
    s.close()
print(ip)

# 使用随机端口
randomPort = random.randint(20000, 30000)
# 使用默认浏览器，打开分享的页面
webbrowser.open('http://' + ip + ':' + str(randomPort))
# 打开要分享的目标文件夹
os.chdir(sys.path[0])
# 启动服务，建设静态文件服务
os.system('python -m SimpleHTTPServer ' + str(randomPort))
```

# mac 端如果遇到执行权限问题
- mac 端若提示没有权限执行该软件，则需要赋予权限，但授权过程仅需执行一次，后续使用无需再次授权。
  ![](http://upyun.luckly-mjw.cn/Assets/lan-transmitter/016.png)
- 打开 mac 自带的「终端」软件

  ![](http://upyun.luckly-mjw.cn/Assets/lan-transmitter/014.png)
- 输入`chmod +x `，将该软件拖入终端中，自动获取该软件的路径。
  ![](http://upyun.luckly-mjw.cn/Assets/lan-transmitter/015.png)
- 回车，完成授权


# 追求极简，追求极致
![](http://upyun.luckly-mjw.cn/Assets/lan-transmitter/013.jpeg)
