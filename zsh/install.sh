#!/bin/bash

self_dir=`realpath $(dirname $0)`

install_osh() {
    git clone https://gitee.com/mirrors/oh-my-zsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
}

[ ! -e ~/.zprofile ] && ln -s $self_dir/zprofile ~/.zprofile
[ ! -e ~/.oh-my-zsh -a ! -e ~/.zshrc ] && install_osh
