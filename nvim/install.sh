#!/bin/bash

self_dir=`realpath $(dirname $0)`

mkdir -p ~/.config
ln -sf $self_dir ~/.config/

mkdir -p ~/.local/bin
[ ! -e ~/.local/bin/vim ] && ln -s `which nvim` ~/.local/bin/vim

