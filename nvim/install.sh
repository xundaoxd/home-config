#!/bin/bash

self_dir=`realpath $(dirname $0)`

mkdir -p ~/.config
ln -sf $self_dir ~/.config/

