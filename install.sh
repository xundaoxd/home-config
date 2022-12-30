#!/bin/bash

self_path=`realpath ${BASH_SOURCE[0]:-$0}`
self_dir=`dirname $self_path`

./zsh/install.sh
./nvim/install.sh

