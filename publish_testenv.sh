#!/bin/sh
./build.sh
rsync -r --delete output/ pigeon@testenv:/opt/pigeon/blog/
