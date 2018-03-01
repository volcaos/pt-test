#!/bin/sh


# Ubuntuのパッケージ更新
apt update
apt upgrade -y

# 必要なパッケージのインストール
apt install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3
apt install -y git
apt install -y libboost-all-dev

# BerkeleyDB
apt install -y software-properties-common
add-apt-repository -y ppa:bitcoin/bitcoin
apt update
apt install -y libdb4.8-dev libdb4.8++-dev

# Bitcoin (0.15)
cd ~
git clone -b 0.15 https://github.com/bitcoin/bitcoin.git
cd bitcoin
./autogen.sh
./configure --without-gui
make
make install

# c-lightning

# Get dependencies:
apt install -y autoconf automake build-essential git libtool libgmp-dev libsqlite3-dev python python3 net-tools libsodium-dev
# For development or running tests, get additional dependencies:
#echo "Asia/Tokyo" > /etc/timezone    
#dpkg-reconfigure -f noninteractive tzdata
apt install -y asciidoc valgrind python3-pip
pip3 install python-bitcoinlib
# Clone & Build
cd ~
git clone https://github.com/ElementsProject/lightning.git
cd lightning
make
make install

