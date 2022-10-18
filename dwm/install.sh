#!/bin/bash

self_dir=`realpath $(dirname $0)`

mkdir -p ~/.local/share/dwm
ln -sf $self_dir/autostart/autostart.sh ~/.local/share/dwm/

mkdir -p .config
ln -sf $self_dir/picom/picom.conf ~/.config/picom.conf

