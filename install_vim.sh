#!/bin/bash
set -e

#install powerline and fonts
pip3 install powerline-status
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

#install vim8
git clone https://github.com/vim/vim temp
cd temp
PYCODIR=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu 
if [ ! -d $PYCODIR ]; then
	echo "Python config dir is not located in $PYCODIR"
	echo "Find its path and modify vim configure call to point to it"
	exit 1
fi 

export LDFLAGS="-L$HOME/lib -L$HOME/include/ncurses -L$HOME/include"
./configure --prefix=$HOME \
		     --enable-multibyte \
		     --enable-python3interp \
		     --with-python3-config-dir=$PYCODIR \
		     --enable-perlinterp=yes \
		     --enable-gui=gtk2 \
		     --enable-cscope 
make
make install
cd ../
rm -rf temp

#install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#clone solarized colors
git clone https://github.com/altercation/vim-colors-solarized ~/.vim/bundle
mkdir -p ~/.vim/colors
cp ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/ 

#copy config file
cp configs/.vimrc ~/.vimrc

#install plugins
vim +PluginInstall +qall

#compile YCM
cd ~/.vim/bundle/YouCompleteMe
./install.py

#install ctags
git clone https://github.com/universal-ctags/ctags.git
cd ctags
./autogen.sh 
./configure --prefix=$HOME
make
make install
cd ../
rm -rf ctags

