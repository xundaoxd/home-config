#!/bin/bash

self_path=`realpath ${BASH_SOURCE[0]:-$0}`
self_dir=`dirname $self_path`

mkdir -p ~/.config
ln -sf $self_dir ~/.config/

mkdir -p ~/.local/bin
[ ! -e ~/.local/bin/vim ] && ln -s `which nvim` ~/.local/bin/vim

