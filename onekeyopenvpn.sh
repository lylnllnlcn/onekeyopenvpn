#!/bin/bash

#适用centos7

#安装epel源
yum -y install epel-release

#安装openvpn
yum -y install openvpn-2.4.6-1.el7 easy-rsa-3.0.3-1.el7

#复制easy到openvpn
cp -rf /usr/share/easy-rsa/ /etc/openvpn/easy-rsa

#复制server.conf
cp -f /usr/share/doc/openvpn-2.4.6/sample/sample-config-files/server.conf /etc/openvpn/

#复制vars
cp -f /usr/share/doc/easy-rsa-3.0.3/vars.example /etc/openvpn/easy-rsa/3.0.3/vars

cd /etc/openvpn/easy-rsa/3.0.3/

#生成ta.key
openvpn --genkey --secret ta.key
#创建pki目录
./easyrsa init-pki
#生成证书
./easyrsa --batch build-ca nopass
#生成服务端证书
./easyrsa --batch build-server-full server nopass
#生成客户端端证书
./easyrsa --batch build-client-full client1 nopass
#生成gen
./easyrsa gen-dh

#管理证书位置
cp /etc/openvpn/easy-rsa/3.0.3/pki/ca.crt /etc/openvpn/
cp /etc/openvpn/easy-rsa/3.0.3/pki/issued/server.crt /etc/openvpn/
cp /etc/openvpn/easy-rsa/3.0.3/pki/dh.pem /etc/openvpn/dh2048.pem
cp /etc/openvpn/easy-rsa/3.0.3/pki/private/server.key /etc/openvpn/
cp /etc/openvpn/easy-rsa/3.0.3/ta.key /etc/openvpn/
cp /etc/openvpn/easy-rsa/3.0.3/pki/issued/client1.crt /etc/openvpn/client/
cp /etc/openvpn/easy-rsa/3.0.3/ta.key /etc/openvpn/client/
cp /etc/openvpn/easy-rsa/3.0.3/pki/ca.crt /etc/openvpn/client/
cp /etc/openvpn/easy-rsa/3.0.3/pki/private/client1.key /etc/openvpn/client/

#关闭firewalld
systemctl stop firewalld
systemctl disable firewalld

#安装iptables
yum install -y iptables-services 
systemctl enable iptables 
systemctl start iptables 

#清除规则
iptalbes -F
iptables -t nat -A POSTROUTING -s 10.8.0.0/16 ! -d 10.8.0.0/16 -j MASQUERADE
service iptables save

#启用转发
echo 1 > /proc/sys/net/ipv4/ip_forward

#永久转发
echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf

#配置服务端server.conf
cd /etc/openvpn
rm -f server.conf
curl -o server.conf https://raw.githubusercontent.com/yobabyshark/onekeyopenvpn/master/server.conf

#启动udpspeeder和udp2raw


#启动openvpn
systemctl start openvpn@server


