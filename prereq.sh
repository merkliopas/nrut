#!/bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 

#append few lines to bashrc to ensure paths are correct
cat <<EOT>> ~/.bashrc
PATH=\$HOME/bin:\$PATH
LD_LIBRARY_PATH=\$HOME/lib:\$LD_LIBRARY_PATH
C_INCLUDE_PATH=\$HOME/include
CPLUS_INCLUDE_PATH=\$HOME/include
EOT

#install ncurses
git clone https://github.com/gittup/ncurses temp
cd temp
./configure --prefix=$HOME
make
make install
cd ../ && rm -rf temp

#install libevent
git clone https://github.com/libevent/libevent temp
cd temp
./autogen.sh
./configure --prefix=$HOME
make
make install
cd ../ && rm -rf temp

#install pkg-config: if error, comment this out and try again
wget https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz
tar xzf pkg-config-0.29.2.tar.gz
cd pkg-config-0.29.2
./configure --prefix=$HOME
make
make install
cd ../ && rm -rf pkg-config-0.29.2*

echo "PLEASE RESTART YOUR TERMINAL NOW"
