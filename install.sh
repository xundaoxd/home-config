#!/bin/bash

self_path=$(realpath "${BASH_SOURCE[0]:-$0}")
self_dir=$(dirname "$self_path")

die() {
    echo "$0"
    exit 255
}

init() {
    cat >> ~/.xprofile << \EOF
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

export PATH="$HOME/.local/bin:$PATH"
EOF
}

install_osh() {
    [ -e ~/.oh-my-zsh ] && die "oh my zsh installed, exited"

    git clone https://gitee.com/mirrors/oh-my-zsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
}

install_nvim() {
    [ -e ~/.config/nvim ] && die "nvim installed, exited"

    mkdir -p ~/.config
    ln -sf "$self_dir/nvim" ~/.config/

    mkdir -p ~/.local/bin
    ln -sf "$(which nvim)" ~/.local/bin/vim

    echo 'export EDITOR="nvim"' >> ~/.zshrc
}

install_ranger() {
    mkdir -p ~/.config
    ln -sf "$self_dir/ranger" ~/.config/

    mkdir -p ~/.local/bin
    [ ! -e ~/.local/bin/ra ] && ln -s "$(which ranger)" ~/.local/bin/ra
}

main(){
    init
    install_osh
    install_nvim
    install_ranger
}

main

