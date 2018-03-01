#!/bin/sh

# Bitcoin (0.15)
cd ~
git clone -b 0.15 https://github.com/bitcoin/bitcoin.git
cd bitcoin
./autogen.sh
./configure --without-gui
make
make install

# c-lightning
cd ~
git clone https://github.com/ElementsProject/lightning.git
cd lightning
make
make install

