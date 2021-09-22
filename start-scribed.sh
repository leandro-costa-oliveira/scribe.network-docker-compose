#!/bin/bash

apt update && apt -y install wget sudo gnupg lsb-release
wget -qO - https://scribe.network/ppa/KEY.gpg | sudo apt-key add -
wget -qO - https://scribe.network/ppa/ubuntu/bionic/scribe.list > /etc/apt/sources.list.d/scribe.list
apt update
apt -y install scribe
scribed