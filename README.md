# shadowsocks server 配置
## 安装 
### 一、一键配置
```sh
 $ wget https://raw.githubusercontent.com/XiaoNaoXu/filecopy/master/shadowsocks.sh && chmod +x shadowsocks.sh && ./shadowsocks.sh
```

### 二、分步配置
```sh
 $ wget https://raw.githubusercontent.com/XiaoNaoXu/filecopy/master/shadowsocks.sh
 $ chmod +x shadowsocks.sh
 $ ./shadowsocks.sh
```
## 三、设置代理，代理软件如polipo（全局代理）, privoxy（自动+全局代理）
### polipo安装
'''sh
$ sudo apt install polipo
$ sudo vim /etc/polipo/config 
''''
#### 在末尾加入如下内容：
  proxyAddress = "0.0.0.0"
  socksParentProxy = "127.0.0.1:1080"
  socksProxyType = socks5
#### 就可以使用了（polipo默认端口是8123）：
  $ sudo service polipo restart
  $ wget -e “http_proxy=127.0.0.1:8123″  proxy.mimvp.com
#### 或者(这只是临时的，终端关闭后失效，并且只对当前终端有效)：
  $ export http_proxy=http://127.0.0.1:8123
  $ export https_proxy=http://127.0.0.1:8123
  $ export ftp_proxy=http://127.0.0.1:8123
#### 全局办法，修改~/.bashrc，如果你使用的是bash的话(作者也就是我用的是zsh所以修改的是~/.zshrc):
  $ vim ~/.bashrc
   export http_proxy=http://127.0.0.1:8123
   export https_proxy=http://127.0.0.1:8123
   export ftp_proxy=http://127.0.0.1:8123
  $ source ~/.bashrc
#### 大功告成，如果你不怕服务器被封的话就可以这么使用，大约0.5-2个小时你就会发现VPS服务器端口被qiang了，多次之后IP也没了。。。 
''''
### privoxy安装与使用
'''sh
#### privoxy安装
$ sudo apt install privoxy
#### pip2(pip3没有这个包)安装gfwlist2privoxy
$ pip2 install gfwlist2privoxy
$ gfwlist2privoxy -i https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt -f /etc/privoxy/gfwlist.action -p 127.0.0.1:1080 -t socks5
##### 最后在privoxy的配置文件/etc/privoxy/config中加入引用生成的文件 /etc/privoxy/gfwlist.action
$ vim /etc/privoxy/config 并加入(你可以跳转到385行左右，哪里有其他规则文件样式)  actionsfile /etc/privoxy/gfwlist.action
$ sudo service privoxy restart
#### 设置代理的方法如同polipo，唯一差异就是privoxy的默认端口是8188，可以在/etc/privoxy/config中更改
'''

'''

## 使用说明
```
 1. 购买一个服务器。
 2. ssh登录该服务器。
 3. 复制安装命令运行。
 4. 在你的终端上安装客户端，并连接。这里不再解释，请自行谷歌或百度。
 5. 设置代理
```
