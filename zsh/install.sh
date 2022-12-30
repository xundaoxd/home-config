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

    cat >> ~/.zshrc << \EOF
add_local() {
    [ -d $1/bin ] && export PATH="$1/bin:$PATH"
}
add_local $HOME/.local
EOF
    if [[ $SHELL != *zsh ]]; then
        chsh -s `which zsh`
    fi
}

install_osh

