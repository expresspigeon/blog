#!/usr/bin/env bash
cat scripts/templates/blog_template.md > src/content/blog/posts/2018/$1.md
cat scripts/templates/blog_template.md > src/content/blog/posts/2018/$1.excerpt.md
cat scripts/templates/blog_template.properties > src/content/blog/posts/2018/$1.properties

