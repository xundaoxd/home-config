#!/bin/bash

self_dir=`dirname $0`

mkdir -p ~/.config
ln -sf `realpath $self_dir` ~/.config/

