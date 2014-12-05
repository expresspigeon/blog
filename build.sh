#!/bin/sh

rm -rf output
mkdir output

cp -r src/content/images/ output/blog_images

for file in `find src/content/posts/ -name *.md`
 do
   export file_name=`echo $file | tr '.' ' ' | awk '{print $1}'`
   cp $file_name.properties output
done

for file in `find src/content/posts/ -name *.md`
 do
   export file_name=`echo $file | tr '/' ' ' | awk '{print $5}'`
   pandoc -f markdown -t html   $file -o output/$file_name.html
done
