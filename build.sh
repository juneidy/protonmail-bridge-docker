#!/bin/bash

ver=3.0.19

docker build -t juneidy/protonmail-bridge:${ver}-2 --build-arg VERSION=$ver .
