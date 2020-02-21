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


openv多用户版
VPS系统需安装为centos7

步骤综述

1、搭建服务端：使用一键脚本，初始化配置多个账户

2、从服务端获取配置文件

3、安装openvpn客户端

4、连接使用

一、搭建服务端

首先使用xshell等工具连接VPS，安装必要的工具

yum install -y wget
然后执行下面的一键脚本

wget https://raw.githubusercontent.com/atrandys/openv-mana/master/openv_install_sin.sh && chmod +x openv_install_sin.sh && ./openv_install_sin.sh
等待脚本执行，然后根据提示选择初始配置的用户数，并回车，脚本会显示刚刚增加的用户信息，自行复制保存即可。如下图所示：
openv多用户版

二、从服务器获取配置文件

使用xftp等ftp工具连接VPS，并进入/etc/openvpn/client目录下，将client.ovpn、client_down.bat、client_pre.bat传输到桌面，先暂时保存在桌面，后面步骤需要使用。

openv多用户版

 

三、安装openvpn客户端

1、下载openvpn客户端并安装。

网盘下载：点击下载openvpn 

安装时建议在安装包上右键，使用管理员权限运行，安装过程各种下一步就可以了，我这里示例的时候是安装在D盘了，具体目录是D:\Program Files\OpenVPN，你也可以安装到C:\Program Files\OpenVPN，这两个目录二选一。不要选择其他目录。如果脚本没有移动speeder和udp2raw到config文件夹，请手动将两个文件移动到openvpn安装目录下的config文件夹中。

2、将步骤二中的3个文件放到openvpn安装目录下的config文件夹中。

将步骤二中的3个下载到桌面的文件，剪切然后粘贴到openvpn安装目录下的config文件夹中，我这里安装在了D盘，所以具体目录是D:\Program Files\OpenVPN\config。如果你的openvpn安装在C:\Program Files\OpenVPN就自把3个文件粘贴到C:\Program Files\OpenVPN\config文件夹中。

3、配置openvpn配置文件。

打开openvpn客户端，然后在右下角的程序中右键，选择setting。

openv多用户版

然后进入Advanced页签，将Folder选择成你保存3个文件的目录，也就是步骤2中的config文件夹，选择完成后点击确定。

openv多用户版

ok，到这里你的openvpn配置完了，先暂时不用管，进入步骤四。

四、使用教程

1、打开openvpn客户端，然后在的openvpn图标上右键，选择connect，这时候需要你填写用户名和密码，用户信息我们在第一步搭建服务端时已经获得了，填写其中一个即可，等待右下角图标变成绿色，说明连接成功了。

openv多用户版

2、如果点击connect后提示错误，那么你可能需要安装一个插件winpcap，点击这里下载，下载后安装上即可，然后再重新连接。

3、此时你电脑的所有流量都是通过VPN的，所以如果你需要玩游戏，直接打开就可以了，不像之前还需要开sstap、proxfier等工具了。

4、你可以测试一下是否代理成功了，打开浏览器，然后打开 https://www.ipip.net/ip.html  这个网页，如果网页的ip显示vps的ip，说明代理是OK的。

5、注意：虽然开启vpn后你可以自由上网了，但是不建议进行刷视频等流量消耗较大的操作，因为我们为了保证游戏顺畅流量消耗会是正常的2-3倍，游戏的流量相对较小，所以即使2-3倍流量也没什么可担心的，视频则不然。

如何让多个用户使用

1、把步骤二中下载的3个文件分享给其他用户，这三个文件是通用的，不需要修改文件中的内容。

2、其他用户安装上本教程里的openvpn客户端，并把3个文件放在config目录中。（参照步骤三）

3、配置openvpn客户端config文件的位置。（参照步骤三）

4、分配用户名密码给其他用户，其他用户连接openvpn并填写用户名和密码即可。
