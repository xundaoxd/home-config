#!/bin/bash

self_dir=`realpath $(dirname $0)`

mkdir -p ~/.config
ln -sf $self_dir ~/.config/ranger

mkdir -p ~/.local/bin
[ ! -e ~/.local/bin/ra ] && ln -s `which ranger` ~/.local/bin/ra

