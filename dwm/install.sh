#!/bin/bash

self_dir=`dirname $0`

mkdir -p ~/.dwm
cp -r $self_dir/autostart/* ~/.dwm/

