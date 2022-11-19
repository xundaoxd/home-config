#!/bin/bash

self_dir=`realpath $(dirname $0)`

install_osh() {
    git clone https://gitee.com/mirrors/oh-my-zsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    echo 'export EDITOR="nvim"' >> ~/.zshrc
    echo '[ -d $HOME/.local/bin ] && export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
    if [[ $SHELL != *zsh ]]; then
        chsh -s `which zsh`
    fi
}

[ ! -e ~/.oh-my-zsh -a ! -e ~/.zshrc ] && install_osh

