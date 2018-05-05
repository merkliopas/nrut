#!/bin/bash
set -e

git clone https://github.com/tmux/tmux temp
cd temp
latesttag=$(git describe --tags)
git checkout ${latesttag}
./autogen.sh
./configure --prefix=$HOME\
		     CFLAGS="-I$HOME/include -I$HOME/include/ncurses"\
		     LDFLAGS="-L$HOME/lib -L$HOME/include/ncurses -L$HOME/include"\
		     CPPFLAGS="-I$HOME/include -I$HOME/include/ncurses"\
		     LDFLAGS="-static -L$HOME/include -L$HOME/include/ncurses -L$HOME/lib"
make
make install
cd ../
rm -rf temp
