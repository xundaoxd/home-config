#!/bin/bash

self_dir=`dirname $0`

find $self_dir -mindepth 2 -maxdepth 2 -name "install.sh" -executable -exec {} \;

