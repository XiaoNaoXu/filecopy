#!/bin/bash

apt update && apt install python3.7 -y && apt install python3-pip -y && pip3 install shadowsocks
echo '{ "server": "0.0.0.0",
    "port_password": {"30001": "password1","30002": "password2","30003": "password3","30004": "password4"},
    "timeout": 300,"method": "aes-256-cfb", 
    "protocol": "auth_sha1_v4_compatible",
    "protocol_param": "5",
    "obfs": "plain",
    "obfs_param": "",
    "speed_limit_per_con": 0,
    "speed_limit_per_user": 0
}' > /etc/shadowsocks.json
systemctl stop firewalld.service
sed -i "s/cleanup/reset/g" /usr/local/lib/python3.7/dist-packages/shadowsocks/crypto/openssl.py
ssserver -c /etc/shadowsocks.json -d start
