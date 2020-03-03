#!/bin/bash

apt update && apt install python3.7 -y && apt install python3-pip -y && pip3 install shadowsocks
echo '{ "server": "0.0.0.0",
    "port_password": {"3001": "password1","3002": "password2","3003": "password3","3004": "password4"},
    "timeout": 300,"method": "aes-256-cfb", 
    "protocol": "auth_sha1_v4_compatible",
    "protocol_param": "10",
    "obfs": "plain",
    "obfs_param": "",
    "speed_limit_per_con": 0,
    "speed_limit_per_user": 0
}' > /etc/shadowsocks.json
systemctl stop firewalld.service
sed -i "s/cleanup/reset/g" /usr/local/lib/python3.7/dist-packages/shadowsocks/crypto/openssl.py
ssserver -c /etc/shadowsocks.json -d start
