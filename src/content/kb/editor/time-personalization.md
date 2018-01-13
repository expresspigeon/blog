# Progressive campaigns / Time personalization
 
 Progressive campaigns allow you to customize a send time for every contact on that campaign.


## Overview

Our platform allows for personalization of time to send. For instance, when you send a campaign to your audience,
you can customize time of email delivery for each and every individual.

In all cases, the messages will be delivered within 24 hours from the time of send, depending on the type of a campaign: 
 Fixed or Rolling.

## Setup

In order to enable Progressive campaigns, please add a new Custom field called `send_time` (see [Custom field](contact-fields#custom-fields) for how add). 

The presence of this special field `send_time` on your account will automatically enable the Progressive campaign 
  option on the "Send campaign" page. 

![](images/progressive_campaign.png)

## Send time field format

The format for `send_time` field is expected to be in military format with hours from 0-23, and minutes from 0-59.

> Example: 1:52 PM will be 13:52.

If a value is not provided or format is not correct, such message will be sent immediately with the campaign.

## Fixed campaign

In a fixed campaign all messages will be sent by midnight on the day of send. For example, if you send a 
message at 10:00 AM and there are people for whom `send_time` is set to deliver prior to 10:00 AM, their
messages will be sent immediately, while anyone scheduled to receive after 10:00 AM will receive their
message at the time specified in the `send_time` field.

## Rolling campaign

Rolling campaigns do not end at midnight like  Fixed campaigns, but roll over a 24 hour period from the time 
of send. If you schedule a rolling campaign at 9:00 AM and have a recipient who is scheduled to receive their message at 8:00 AM, that
recipient would receive their message at 8:00 AM on the following day. This is why this type of campaign is called "Rolling" (it rolls into the next day). Anyone else, 
whose send time is between the time of send and midnight will get the message on the same day, which is the same as a Fixed campaign.


