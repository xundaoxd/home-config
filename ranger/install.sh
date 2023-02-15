#!/bin/bash

self_path=`realpath ${BASH_SOURCE[0]:-$0}`
self_dir=`dirname $self_path`

mkdir -p ~/.config
ln -sf $self_dir ~/.config/

mkdir -p ~/.local/bin
[ ! -e ~/.local/bin/ra ] && ln -s `which ranger` ~/.local/bin/ra

