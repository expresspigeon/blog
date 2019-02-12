#!/usr/bin/env bash

export YEAR=2019
cat scripts/templates/blog_template.md > src/content/blog/posts/$YEAR/$1.md
cat scripts/templates/blog_template.md > src/content/blog/posts/$YEAR/$1.excerpt.md
cat scripts/templates/blog_template.properties > src/content/blog/posts/$YEAR/$1.properties

