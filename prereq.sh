#!/bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 

#append few lines to bashrc to ensure paths are correct
cat <<EOT>> ~/.bashrc
PATH=\$HOME/bin:\$PATH
LD_LIBRARY_PATH=\$HOME/lib:\$LD_LIBRARY_PATH
C_INCLUDE_PATH=\$HOME/include
CPLUS_INCLUDE_PATH=\$HOME/include

export NVM_DIR="\$HOME/.nvm"
NVM_DIR="\$HOME/.nvm"
[ -s "\$NVM_DIR/nvm.sh" ] && . "\$NVM_DIR/nvm.sh"
[ -s "\$NVM_DIR/bash_completion" ] && . "\$NVM_DIR/bash_completion"

if [ -d "~/.nvm" ]; then
	source "\$NVM_DIR/nvm.sh"
fi
EOT

#get nodejs and npm, required for color scheme and other applets
cd ~/
git clone https://github.com/creationix/nvm.git ~/.nvm 
cd ~/.nvm 
latesttag=$(git describe --tags)
git checkout ${latesttag}
cd $DIR

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

./configure --prefix=$HOME\
		     CFLAGS="-I$HOME/include -I$HOME/include/ncurses"\
		     LDFLAGS="-L$HOME/lib -L$HOME/include/ncurses -L$HOME/include"\
		     CPPFLAGS="-I$HOME/include -I$HOME/include/ncurses"\
		     LDFLAGS="-static -L$HOME/include -L$HOME/include/ncurses -L$HOME/lib"

#install pkg-config: if error, comment this out and try again
wget https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz
tar xzf pkg-config-0.29.2.tar.gz
cd pkg-config-0.29.2
./configure --prefix=$HOME
make
make install

echo "PLEASE RESTART YOUR TERMINAL NOW"
