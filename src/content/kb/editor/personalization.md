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

Placeholders can be placed into your subject line to increase open rates. Make sure you use the correct [Standard or a Custom field](contact-fields) with the correct CSV data and our system will insert the correct subject line personalization for each of ytour individual subscribers.

![](images/subject-merge.png)

### Personalize paragraphs

Personalized paragraphs allow you to send completely different content to each of your subscribers. You can accomplish this by simply inserting a placeholder for the correct [Standard or a Custom field](contact-fields) into the body of your newsletter as shown. Be sure to have the correct paragraph in your CSV data and ExpressPigeon will insert the correct copy in for each of your subscribers automatically. 

![](images/paragraph-merge.png)

### Dictionaries

ExpressPigeon provides 20 custom fields. In cases when this is insufficient, you can use another feature called Dictionaries.
Basically, dictionaries allow to configure an endless number of customized content for each and every contact.
  
For more information, refer to [Dictionaries](dictionaries). 


## Progressive campaigns
 
 Progressive allow to customize a send time for every contact on that campaign.


### Overview

Our platform allows for personalization of time to send. For instance, when you send a campaign to your audience,
you can customize time of email delivery for each and every individual.

In all cases, the messages will be delivered within 24 hours from the time of send, depending on the type of a campaign: 
 Fixed or Rolling

### Setup

In order to enable Progressive campaigns, please add a new Custom field called `send_time` (see [Custom field](contact-fields#custom-fields) for how add). 

The presence of this special field `send_time` on your account will automatically enable the Progressive campaign 
  option on the "Send campaign" page. 

![](images/progressive_campaign.png)

### Send time field format

The format for `send_time` field is expected to be in military format with hours from 0-23, and minutes from 0-59.

> Example: 1:52 PM will be 13:52.

If a value is not provided or format is not correct, such message will be sent immediately with the campaign.

### Fixed campaign

In a fixed campaign all messages will be sent by midnight on the day of send. For example, if you send a 
message at 10:00 AM and there are people for whom `send_time` is set to deliver prior to 10:00 AM, their
messages will be sent immediately, while anyone scheduled to receive after 10:00 AM will receive their
message at the time specified in the `send_time` field.

### Rolling campaign

Rolling campaigns do not end at midnight like  Fixed campaigns, but roll over a 24 hour period from the time 
of send. If you schedule a rolling campaign at 9:00 AM and have a recipient who is scheduled to receive their message at 8:00 AM, that
recipient would receive their message at 8:00 AM on the following day. This is why this type of campaign is called "Rolling" (it rolls into the next day). Anyone else, 
whose send time is between the time of send and midnight will get the message on the same day, which is the same as a Fixed campaign.


