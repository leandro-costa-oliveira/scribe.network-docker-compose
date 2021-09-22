#!/bin/bash

apt update
apt -y install wget sudo gnupg lsb-release git anacron
wget -qO - https://scribe.network/ppa/KEY.gpg | sudo apt-key add -
wget -qO - https://scribe.network/ppa/ubuntu/bionic/scribe.list > /etc/apt/sources.list.d/scribe.list
apt update
apt -y install scribe

# Sentinel
apt -y install python-virtualenv python-pip
git clone https://github.com/scribenetwork/sentinel.git
cd sentinel
virtualenv ./venv
./venv/bin/pip install -r requirements.txt
echo "* * * * * cd /root/sentinel && ./venv/bin/python bin/sentinel.py >/dev/null 2>&1" > /var/spool/cron/crontabs/root
cron 

# test the configuration
./venv/bin/py.test ./test

# Starting Scribe Daemon
scribed