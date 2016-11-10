#!/bin/sh
mvn clean install
rsync -r --delete -4 -v /opt/pigeon/blog pigeon@expresspigeontest.com:/opt/pigeon/
rsync -r --delete -4 -v /opt/pigeon/kb pigeon@expresspigeontest.com:/opt/pigeon/

rsync -r --delete -4 -v /opt/pigeon/search_index  pigeon@expresspigeontest.com:/opt/pigeon/
