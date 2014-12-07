#!/bin/sh
./build.sh
rsync -r --delete output/ /opt/pigeon/blog/
