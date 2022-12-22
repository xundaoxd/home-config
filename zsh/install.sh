#!/bin/bash

self_dir=`realpath $(dirname $0)`

die() {
    echo $1
    exit -1
}

install_osh() {
    [ -e ~/.oh-my-zsh ] && die "oh my zsh installed, exited"

    git clone https://gitee.com/mirrors/oh-my-zsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

    echo '[ -d $HOME/.local/bin ] && export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
    if [[ $SHELL != *zsh ]]; then
        chsh -s `which zsh`
    fi
}

install_osh

