# Custom tracking domains 

## Definitions

Every email has images and links, which in turn have URLs (images are downloaded from such URLs, and 
links force your email program to navigate to these URLs). 

By default, we have our ExpressPigeon domains for links and images. Such domains are `epsrv1.net`, `epsrv2.net`, etc.
 In other words, the images are downloaded from our servers, and links point back to our servers  too. 
 
 We recommend that you whitelabel thse domains. For instance, an image URL 
  might look like this before whitelabeling: 

```
http://content.epsrv3.net/image_gallery/uploaded/284/6940/halloween_header.jpg
```

It will look like this after: 

```
http://content.yourdomain.com/image_gallery/uploaded/284/6940/halloween_header.jpg
```
     
where "yourdomain.com" will point to your business domain. 

> We recommend whitelabeling tracking domains to strengthen your brand across email channel. 


## Instructions

**Step 1: ** Please add the following CNAME entries for your domain:

    CNAME clicks       clicks.epsrv2.net
    CNAME unsub        email.epsrv2.net
    CNAME content      content.epsrv2.net
    CNAME open         open.epsrv2.net
    CNAME viewer       viewer.epsrv2.net
    
You will have to make modifications to DNS records of your domain (proceed carefully). 


**Step 2: ** Reach out to our [Support](https://expresspigeon.com/support) to verify and complete your configuration.
 
 
  
