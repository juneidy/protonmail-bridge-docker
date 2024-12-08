#!/bin/bash

ver=3.15.0

docker build -f alpine.Dockerfile -t juneidy/protonmail-bridge:${ver}-alpine --build-arg VERSION=$ver .
