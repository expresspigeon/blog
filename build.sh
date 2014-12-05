#!/bin/sh

rm -rf output
mkdir output
mkdir output/posts
mkdir output/posts/blog_images
mkdir output/authors

#move images
cp -r src/content/images/ output/posts/blog_images


#Move property files
for file in `find src/content/posts/ -name *.md`
 do
   export file_name=`echo $file | tr '.' ' ' | awk '{print $1}'`
   cp $file_name.properties output/posts
done

for file in `find src/content/posts/ -name *.md`
 do
   export file_name=`echo $file | tr '/' ' ' | awk '{print $5}'`
   pandoc -f markdown -t html   $file -o output/posts/$file_name.html
done


for file in `find src/content/authors/ -name *.md`
 do
   export file_name=`echo $file | tr '/' ' ' | awk '{print $4}'`
   pandoc -f markdown -t html   $file -o output/authors/$file_name.html
done
