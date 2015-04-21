#!/bin/sh
./build.sh
rsync -r --delete output/ pigeon@sender5.expresspigeon.com:/opt/pigeon/blog/
rsync -r --delete output/ pigeon@sender4.expresspigeon.com:/opt/pigeon/blog/

