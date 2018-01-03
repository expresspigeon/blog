# Personalization

## Content personalization

### Basic value merge

Our general syntax for merging of data into a newsletter has the following format: 
 
 > `${field_name}` where `field_name` is a name of either a [Standard or a Custom field](contact-fields). 

Our platform allows for content personalization in just about any area.

For standard and custom fields, use the UI to inject into your newsletter (include screenshot).

![](images/merge.png)
 
> The drop-down for the merge will contain all [Standard and Custom fields](contact-fields) automatically. 

### Personalize images

For images, you can use the same exact syntax, but insert the URL of the image onto your newsletter. 

So long as all contacts have the image URL as part of the CSV upload, every person might see a different image. 

In order to configure a different image, first create an image block, and in the Image Source field, enter 
the name of your Custom field that contains a URL to images for different contacts. 
 
When a newsletter is processed, our system will automatically deliver the correct image to each of your
subscribers.
 
 

![](images/image-merge.png)


### Personalize links

You can personalize links using the same syntax by simply inserting the correct placeholder directly into the URL field
of the link properties window. 

Be sure to verify that you have a [Standard or a Custom field](contact-fields) with a matching CSV header and have the correct data in place. Our system will automatically insert the correct link for each individual contact. 

![](images/link-merge.png)

### Personalize buttons 

The syntax remains the same throughout all personalization functions in ExpressPigeon. For buttons just insert your placeholder into the "Button link" area then clicking "Create"

As always, be sure to match your data to a [Standard or a Custom field](contact-fields) with the correct CSV data assigned. If everything is correct our system will automatically insert the correct button link in for each of your subscribers.


![](images/button-merge.png)

### Personalize subjects

![](images/subject-merge.png)

### Personalize paragraphs

![](images/paragraph-merge.png)

### Dictionaries

describe what they are, add link to http://localhost:7878/kb/dictionaries and tell to contact us if they want to use it. 


## Send time personalization

### Overview

### Fixed campaign

### Progressive campaign


