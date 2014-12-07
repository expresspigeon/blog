#!/bin/sh

rm -rf output
mkdir output
mkdir output/posts
mkdir output/images
mkdir output/authors

# Copy images
cp -r src/content/images/* output/images

# Copy post property files
for file in `find src/content/posts/ -name "*.md"`
 do
   export file_name=`echo $file | tr '.' ' ' | awk '{print $1}'`
   cp $file_name.properties output/posts
done

# Process posts
for file in `find src/content/posts/ -name "*.md"`
 do
   export file_name=`echo $file | tr '/' ' ' | awk '{print $5}'`
   echo "processing: $file"
   pandoc -f markdown -t html   $file -o output/posts/$file_name.html
done


# Copy authors property files

cp src/content/authors/*.properties output/authors

# Process authors
for file in `find src/content/authors/ -name "*.md"`
 do
   export file_name=`echo $file | tr '/' ' ' | awk '{print $4}'`
   echo "processing: $file"
   pandoc -f markdown -t html   $file -o output/authors/$file_name.html
done
