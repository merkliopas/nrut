#!/bin/bash
set -e

loc=$HOME/unix

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

./configure --prefix=$loc \
		     --enable-multibyte \
		     --enable-python3interp \
		     --enable-perlinterp=yes \
		     --enable-gui=auto \
		     --enable-cscope \
		     --enable-fail-if-missing
make
make install
cd ../
rm -rf temp

#install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#clone solarized colors
git clone https://github.com/altercation/vim-colors-solarized ~/.vim/bundle/vim-colors-solarized
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
./configure --prefix=$HOME/unix
make
make install
cd ../
rm -rf ctags

