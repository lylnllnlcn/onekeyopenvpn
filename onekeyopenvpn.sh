#!/bin/bash

#安装epel源
yum -y install epel-release

#安装openvpn
yum -y install openvpn-2.4.6-1.el7 easy-rsa-3.0.3-1.el7

#复制easy到openvpn
cp -r /usr/share/easy-rsa/ /etc/openvpn/easy-rsa

#复制server.conf
cp /usr/share/doc/openvpn-2.4.6/sample/sample-config-files/server.conf /etc/openvpn/

