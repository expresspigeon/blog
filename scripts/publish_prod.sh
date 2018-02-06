#!/bin/sh
mvn clean install

rsync -r --delete -4 -v /opt/pigeon/blog pigeon@expresspigeon.com:/opt/pigeon/
rsync -r --delete -4 -v /opt/pigeon/kb pigeon@expresspigeon.com:/opt/pigeon/

rsync -r --delete -4 -v /opt/pigeon/search_index  pigeon@sender4.expresspigeon.com:/home/pigeon/
rsync -r --delete -4 -v /opt/pigeon/search_index  pigeon@sender5.expresspigeon.com:/home/pigeon/
rsync -r --delete -4 -v /opt/pigeon/search_index  pigeon@sender01.expresspigeon.com:/home/pigeon/
rsync -r --delete -4 -v /opt/pigeon/search_index  pigeon@sender1.expresspigeon.com:/home/pigeon/
rsync -r --delete -4 -v /opt/pigeon/search_index  pigeon@sender2.expresspigeon.com:/home/pigeon/
rsync -r --delete -4 -v /opt/pigeon/search_index  pigeon@sender3.expresspigeon.com:/home/pigeon/