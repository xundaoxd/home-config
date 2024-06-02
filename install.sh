#!/bin/bash
set -e

self_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

opt_force=n
opt_group='all'

die() {
    echo "$@"
    exit 255
}

init() {
    [[ $opt_force == y ]] && rm -rf ~/.zshrc ~/.zprofile
    [[ -e ~/.zshrc ]] && return

    cp $self_dir/homefs/.xprofile ~/.xprofile
    cp -r $self_dir/homefs/Pictures ~/

    cp $self_dir/homefs/.zshrc ~/.zshrc
    cp $self_dir/homefs/.zprofile ~/.zprofile
}

install_osh() {
    [[ $opt_force == y ]] && rm -rf ~/.oh-my-zsh ~/.zshrc
    [[ -e ~/.oh-my-zsh ]] && return

    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    cat $self_dir/homefs/.zshrc >> ~/.zshrc
}

install_nvim() {
    [[ $opt_force == y ]] && rm -rf ~/.config/nvim ~/.local/bin/vim
    [[ -e ~/.local/bin/vim ]] && return

    mkdir -p ~/.config ~/.local/bin
    ln -sf -T $self_dir/homefs/.config/nvim ~/.config/nvim
    ln -sf -T $(which nvim) ~/.local/bin/vim
}

install_ranger() {
    [[ $opt_force == y ]] && rm -rf ~/.config/ranger ~/.local/bin/ra
    [[ -e ~/.local/bin/ra ]] && return

    mkdir -p ~/.config ~/.local/bin
    ln -sf -T $self_dir/homefs/.config/ranger ~/.config/ranger
    ln -sf -T $(which ranger) ~/.local/bin/ra
}

install_bspwm() {
    [[ $opt_force == y ]] && rm -rf ~/.config/{alacritty,bspwm,polybar,sxhkd}
    [[ -e ~/.config/bspwm ]] && return

    for t in alacritty bspwm polybar sxhkd; do
        ln -sf -T $self_dir/homefs/.config/$t ~/.config/$t
    done
}

install_cmake() {
    [[ $opt_force == y ]] && rm -rf ~/.software/cmake-3.29.3-linux-x86_64 && sed -i -E '/add_local.*cmake/d' ~/.zshrc
    [[ -e ~/.software/cmake-3.29.3-linux-x86_64 ]] && return

    mkdir -p ~/.software
    wget -O - https://github.com/Kitware/CMake/releases/download/v3.29.3/cmake-3.29.3-linux-x86_64.tar.gz \
        | tar -C ~/.software -xz
    echo 'add_local "$HOME/.software/cmake-3.29.3-linux-x86_64"' >> ~/.zshrc

}

install_nodejs() {
    [[ $opt_force == y ]] && rm -rf ~/.software/node-v20.14.0-linux-x64 && sed -i -E '/add_local.*node/d' ~/.zshrc
    [[ -e ~/.software/node-v20.14.0-linux-x64 ]] && return

    mkdir -p ~/.software
    wget -O - https://nodejs.org/dist/v20.14.0/node-v20.14.0-linux-x64.tar.xz \
        | tar -C ~/.software -xJ
    echo 'add_local "$HOME/.software/node-v20.14.0-linux-x64"' >> ~/.zshrc
}

install_ssh() {
    [[ $opt_force == y ]] && rm -rf ~/.ssh/config
    [[ -e ~/.ssh/config ]] && return

    mkdir -p ~/.ssh
    cp -r $self_dir/homefs/.ssh/config ~/.ssh/
}

while getopts 'f' name; do
    case $name in
        f)  opt_force=y;;
        ?)  die "undefine flag: $name";
    esac
done
shift $((OPTIND - 1))

(( $# > 0 )) && opt_group="$*"
[[ $opt_group == "all" ]] && opt_group="init install_osh install_nvim install_ranger install_bspwm install_cmake install_nodejs install_ssh"

for t in $opt_group; do
    $t
done

