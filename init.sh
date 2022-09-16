#!/usr/bin/bash

self_path=`realpath $0`
proj_path=`dirname $self_path`

# nvim config
curl -fLo $proj_path/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c 'PlugInstall | qa'

