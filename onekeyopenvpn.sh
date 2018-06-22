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

#创建pki目录
./easyrsa init-pki

#生成证书
./easyrsa --batch "--req-cn=gamer" build-ca nopass

#生成服务端证书
./easyrsa --batch "--req-cn=gamer" gen-req server nopass




