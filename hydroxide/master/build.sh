#!/bin/bash

wget -N https://github.com/emersion/hydroxide/archive/refs/heads/master.zip

docker build -t hydroxide:latest .
