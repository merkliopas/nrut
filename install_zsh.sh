#!/bin/bash
set -e

#on exit, ensure zsh dir gets deleted
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
function del_zsh {
	cd $DIR && rm -rf zsh*
}
trap del_zsh EXIT

#zsh installation is a little bit more involved
wget -O zsh.tar.gz https://sourceforge.net/projects/zsh/files/latest/download
mkdir zsh && tar -xvzf zsh.tar.gz -C zsh --strip-components 1
cd zsh
./configure --prefix=$HOME\
	CFLAGS="-I$HOME/include -I$HOME/include/ncurses"\
	LDFLAGS="-L$HOME/lib -L$HOME/include/ncurses -L$HOME/include"\
	CPPFLAGS="-I$HOME/include -I$HOME/include/ncurses"\
	LDFLAGS="-static -L$HOME/include -L$HOME/include/ncurses -L$HOME/lib"
make
make install

#install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/283252158563af52f87fd52b15aaaffe029191e5/tools/install.sh -O -)" 

