## Content module has three pieces of content: 

1. Blog
2. Knowledge base
3. Search index for both. 

## Product of build

When a local build is executed, the local content of these directories is replaced: 

1. `/opt/pigeon/blog`
2. `/opt/pigeon/kb`
3. `/opt/pigeon/search_index`
 
> Building this module ensures that local environment always has the most up-to-date content.

## Deployment 

Deployment of content to testenv and production is done with scripts located under `scripts` directory. 
Execution of these scripts needs to be done at the module level: 

```
./scripts/publish.prod.sh
```
