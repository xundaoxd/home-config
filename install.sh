#!/bin/bash
set -e

self_path=$(realpath "${BASH_SOURCE[0]:-$0}")
self_dir=$(dirname "$self_path")

opt_group='all'

die() {
    echo "$0"
    exit 255
}

init() {
    cat > ~/.zprofile << \EOF
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx

[[ -d $HOME/.local/bin ]] && export PATH="$HOME/.local/bin:$PATH"
EOF
}

install_osh() {
    [ -e ~/.oh-my-zsh ] && die "oh my zsh installed, exit"

    git clone https://gitee.com/mirrors/oh-my-zsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
}

install_nvim() {
    [[ -e ~/.local/bin/vim ]] && die "nvim installed, exit"

    mkdir -p ~/.config
    ln -sf "$self_dir/nvim" ~/.config/

    mkdir -p ~/.local/bin
    ln -sf "$(which nvim)" ~/.local/bin/vim

    echo 'export EDITOR="nvim"' >> ~/.zshrc
}

install_ranger() {
    [[ -e ~/.local/bin/ra ]] && die "ranger installed, exit"
    mkdir -p ~/.config
    ln -sf "$self_dir"/ranger ~/.config/

    mkdir -p ~/.local/bin
    ln -s "$(which ranger)" ~/.local/bin/ra
}

install_bspwm() {
    cp -r "$self_dir"/bspwm/* ~/.config/
}

install_obsidian() {
    [[ -e ~/.local/bin/obsidian ]] && die "obsidian installed, exit"
    wget -O ~/.local/bin/obsidian https://github.com/obsidianmd/obsidian-releases/releases/download/v1.3.5/Obsidian-1.3.5.AppImage
    chmod +x ~/.local/bin/obsidian
    mkdir -p ~/.local/bin/obsidian.config
}

(( $# > 0 )) && opt_group="$*"
[[ $opt_group == "all" ]] && opt_group="osh nvim ranger bspwm obsidian"

for t in $opt_group; do
    install_$t
done

