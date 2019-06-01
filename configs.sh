#!/bin/bash
set -e

cp configs/.bashrc ~/.bashrc
cp configs/.zshrc ~/.zshrc
cp configs/.vimrc ~/.vimrc

cd ~
git clone https://github.com/merkliopas/tmux-config.git
./tmux-config/install.sh
rm -rf tmux-config


