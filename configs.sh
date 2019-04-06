#!/bin/bash
set -e

cp configs/.bashrc ~/.bashrc
cp configs/.zshrc ~/.zshrc
cp configs/.vimrc ~/.vimrc
cp configs/terminator ~/.config/terminator/config
cp configs/dircolorslight ~/dircolorslight
cp configs/dircolorsdark ~/.dir_colors

cd ~
git clone https://github.com/merkliopas/tmux-config.git
./tmux-config/install.sh
rm -rf tmux-config


