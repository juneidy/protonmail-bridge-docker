#!/bin/bash

ver=0.2.23
wget -N https://github.com/emersion/hydroxide/archive/v${ver}.tar.gz

docker build -t hydroxide:$ver --build-arg ver=$ver .
