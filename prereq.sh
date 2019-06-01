#!/bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" 

brew install gcc
brew install make
brew install libtool
brew install automake
brew install pkg-config
brew install cmake
brew install python3
brew install ncurses
brew install libevent
sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
brew install wget
