#!/bin/bash
set -e

git clone https://github.com/tmux/tmux temp
cd temp
latesttag=$(git describe --tags)
git checkout ${latesttag}
./autogen.sh
./configure --prefix=$HOME/unix
make
make install
cd ../
rm -rf temp
