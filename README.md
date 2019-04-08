# setup
My linux setp/environment that I use everywhere. It does not require root, but does depend on `gcc`, `make`, `build-essential`, `libtool`, `automake`, `pkg-config`, `cmake`, `python3`, `python3-dev`, `python3-pip` (pressumably, this should be present in a reasonably used linux distro)

What do these bash scripts do?
* `prereq.sh` installs the necessary prerequisites for zsh, tmux, vim and solarized theme for terminator. Hence, this script should be run first.
* `install_tmux.sh` installs the newest tmux version
* `install_vim.sh` installs newest vim version and compiles it from source
* `install_zsh.sh` installs zsh and oh-my-zsh
* `cinfigs.sh` copies my default terminator, vim, tmux and zsh config files to default directory (this should be run last).

One might need to run commands below to deal with insecure directories if zsh is installed:
`compaudit | xargs chown -R "$(whoami)"`
`compaudit | xargs chmod go-w`
