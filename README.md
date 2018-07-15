# onekeyopenvpn
方案openvpn+udpspeeder+udp2raw

udpspeeder、udp2raw作者wangyu，github：https://github.com/wangyu-

####服务端####

###使用一键搭建脚本###

bash <(curl -L -s https://raw.githubusercontent.com/yobabyshark/onekeyopenvpn/master/onekeyopenvpn.sh)

检查一下是否安装正确，执行下面命令

ps aux |grep -e openvpn -e speeder -e udp2raw|grep -v grep

显示三行，内容分别包含speeder、udp2raw、openvpn就ok了


三、从服务端下载几个文件

1、使用xftp连接vps

网盘下载：点击下载xftp  密码: 5n4x

安装下载的xftp，安装过程很简单，注意选择Home & School授权即可，然后打开软件，点击文件下的新建



然后在弹出的页面中，输入主机IP、协议选SFTP、端口号22、用户名root、root用户的密码，ip、端口、root、密码和xshell登录vps时使用的一样，输入完成后点确定保存会话。



然后选择刚刚保存的会话，然后点击连接。



如果参数正确，那么你可以连接成功。

2、下载文件到桌面

在会话上输入/etc/openvpn/client然后回车，你会进入client目录下，你会看到7个文件（示例图片因为没有更新所以显示的5个，没显示client_pre.bat和client_down.bat），全部选中然后鼠标右键，选择传输，这7个文件会下载到你的桌面。



下载成功后，关闭xftp即可。下载的7个文件在我们配置openvpn时使用，先暂时保存在桌面。

四、安装openvpn客户端并配置

1、下载openvpn客户端并安装。

网盘下载：点击下载openvpn  密码: dwv8

安装没什么好说的，各种下一步就可以了，我这里示例的时候是安装在D盘了，具体目录是D:\Program Files\OpenVPN，你也可以安装到C:\Program Files\OpenVPN，这两个目录二选一。不要选择其他目录。

2、将步骤三中的7个文件放到openvpn安装目录下的config文件夹中。

将步骤三中的7个下载到桌面的文件，剪切然后粘贴到openvpn安装目录下的config文件夹中，我这里安装在了D盘，所以具体目录是D:\Program Files\OpenVPN\config。如果你的openvpn安装在C:\Program Files\OpenVPN就自把7个文件粘贴到C:\Program Files\OpenVPN\config文件夹中。

3、配置openvpn配置文件。

打开openvpn客户端，然后在右下角的程序中右键，选择setting。



然后进入Advanced页签，将Folder选择成你保存7个文件的目录，也就是步骤2中的config文件夹，选择完成后点击确定。



ok，到这里你的openvpn配置完了，先暂时不用管，进入步骤五。

五、使用教程

1、打开openvpn客户端，然后在的openvpn图标上右键，选择connect，等待右下角图标变成绿色，说明连接成功了。



2、如果点击connect后提示错误，那么你可能需要安装一个插件winpcap，点击这里下载，下载后安装上即可，然后再重新连接。

3、此时你电脑的所有流量都是通过VPN的，所以如果你需要玩游戏，直接打开就可以了，不像之前还需要开sstap、proxfier等工具了。

4、你可以测试一下是否代理成功了，打开浏览器，然后打开 https://www.ipip.net/ip.html  这个网页，如果网页的ip显示vps的ip，说明代理是OK的。

5、注意：虽然开启vpn后你可以自由上网了，但是不建议进行刷视频等流量消耗较大的操作，因为我们为了保证游戏顺畅流量消耗会是正常的2-3倍，游戏的流量相对较小，所以即使2-3倍流量也没什么可担心的。
