#!/bin/bash

ver=3.0.19

docker build -t protonmail-bridge:$ver --build-arg VERSION=$ver .
