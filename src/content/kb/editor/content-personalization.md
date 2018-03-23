# Content personalization

## Basic value merge

Our general syntax for merging of data into a newsletter has the following format: 
 
 > `${field_name}` where `field_name` is a name of either a [Standard or a Custom field](contact-fields). 

Our platform allows for content personalization in just about any area.

For standard and custom fields, use the UI to inject into your newsletter (include screenshot).

![](images/merge.png)
 
> The drop-down for the merge will contain all [Standard and Custom fields](contact-fields) automatically. 


## Personalized Preview
 
We encourage our users to preview templates in a personalized form for a specific contact.
 
When you are on the Preview Page: 

![](images/personalized-preview.png)


1. Enter the email for the contact you want to preview and hit Enter.
2. Observe the template personalized based on that contact's data.


> We recommend to always preview personalized templates in Desktop, and Phone views before sending.


## Personalize images

For images, you can use the same exact syntax, but insert the URL of the image onto your newsletter. 

So long as all contacts have the image URL as part of the CSV upload, every person might see a different image. 

In order to configure a different image, first create an image block, and in the Image Source field, enter 
the name of your Custom field that contains a URL to images for different contacts. 
 
When a newsletter is processed, our system will automatically deliver the correct image to each of your
subscribers.
 

![](images/image-merge.png)


## Personalize links

You can personalize links using the same syntax by simply inserting the correct placeholder directly into the URL field
of the link properties window. 

Be sure to verify that you have a [Standard or a Custom field](contact-fields) with a matching CSV header and have the correct data in place. Our system will automatically insert the correct link for each individual contact. 

![](images/link-merge.png)

## Personalize buttons 

The syntax remains the same throughout all personalization functions in ExpressPigeon. For buttons just insert your placeholder into the "Button link" area then clicking "Create"

As always, be sure to match your data to a [Standard or a Custom field](contact-fields) with the correct CSV data assigned. If everything is correct our system will automatically insert the correct button link in for each of your subscribers.


![](images/button-merge.png)

## Personalize subjects

Placeholders can be placed into your subject line to increase open rates. Make sure you use the correct [Standard or a Custom field](contact-fields) with the correct CSV data and our system will insert the correct subject line personalization for each of ytour individual subscribers.

![](images/subject-merge.png)

## Personalize paragraphs

Personalized paragraphs allow you to send completely different content to each of your subscribers. You can accomplish this by simply inserting a placeholder for the correct [Standard or a Custom field](contact-fields) into the body of your newsletter as shown. Be sure to have the correct paragraph in your CSV data and ExpressPigeon will insert the correct copy in for each of your subscribers automatically. 

![](images/paragraph-merge.png)

## Dictionaries

ExpressPigeon provides 20 custom fields. In cases when this is insufficient, you can use another feature called Dictionaries.
Basically, dictionaries allow to configure an endless number of customized content for each and every contact.
  
For more information, refer to [Dictionaries](dictionaries). 
