#!/bin/sh
./build.sh
rsync -r --delete output/ pigeon@web1:/opt/pigeon/blog/

