# onekeyopenvpn
本游戏代理方案使用openvpn+udp2raw+udpspeeder，只简单搞了服务端centos7+客户端windows 64bit，方案使用的软件都提供了出处，你也可以按步骤自行搞定其他版本。

本方案中udp2raw为openvpn的udp流量加上tcp头，伪装避免运营商Qos。udpspeeder可以降低丢包，通过FEC技术和多倍发包，这里配置为2倍发包，所以流量会消耗两倍，如果刷视频可要注意流量。

服务端系统：centos7需求

客户端系统：64位win7/8/10需求

udpspeeder、udp2raw软件的作者为@wangyu-，github：https://github.com/wangyu-

### 服务端 ###

#### 使用一键搭建脚本 ####

> bash <(curl -L -s https://raw.githubusercontent.com/yobabyshark/onekeyopenvpn/master/onekeyopenvpn.sh)

#### 检查一下是否安装正确，执行下面命令

> ps aux |grep -e openvpn -e speeder -e udp2raw|grep -v grep

显示speeder、udp2raw、openvpn就ok了

### 客户端

#### openvpn客户端安装

网盘下载：https://pan.baidu.com/s/1-NS_tX-OoVmTOa8A3-TWUw  密码: dwv8

这个版本openvpn将udpspeeder和udp2raw通过rar打包了自解压安装，所以你把软件安装到D:\Program Files\OpenVPN或C:\Program Files\OpenVPN目录下，udpspeeder和udp2raw的执行文件会自动解压到安装目录下的config文件夹。

#### 获取openvpn配置文件

sftp工具连接服务器，进入/etc/openvpn/client目录，将全部文件下载到你的openvpn安装目录下的config文件夹中，这个是openvpn配置文件目录。

其中client_pre.bat、client_down.bat分别为udpspeeder、udp2raw的开启脚本、关闭脚本，openvpn会自动调用，不需要你手动执行。

#### 配置openvpn客户端

打开openvpn客户端，然后在右下角的程序中右键，选择setting。

然后进入Advanced页签，将Folder选择成你的openvpn的配置文件目录，即config目录。

### 使用openvpn

打开openvpn客户端，然后在的openvpn图标上右键，选择connect，等待右下角图标变成绿色，说明连接成功了，电脑所有的流量都将使用openvpn。

### 可能遇到的问题

如果点击connect后提示错误，提示类似winpcap的，那么你可能需要安装一个插件winpcap，自行下载安装即可。

