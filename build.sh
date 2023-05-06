#!/bin/bash

ver=3.1.2

docker build -t juneidy/protonmail-bridge:${ver} --build-arg VERSION=$ver .
