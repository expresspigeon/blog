# Transactional Messages Concepts


Transactional email messages are also called triggered emails. Unlike bulk emails, they are sent one at the time on per 
need basis and contain highly personalized content. 

Examples of triggered emails can be one-off messages, such as password reset, statement generated, etc.

## Built as a REST API

We offer a simple [REST](https://en.wikipedia.org/wiki/Representational_state_transfer)- based API
for [sending messages](transactional-send) and for [getting reports](transactional-reporting-for-single-message).

Since our Transactional Email Service is one of our APIs, it conforms to the general API rules:

* [API General Concepts](general-concepts)
* [Security and authentication](security-and-authentication)
* [Error codes and responses](error-codes-responses)

## Use Our Powerful Editor for Templates

Our transactional email service is built around our [email editor](editor-layout).
Using the editor removes a lot of issues stemming from managing internal HTML code and saves you _time and money_:

* Developers' are responsible for triggering the right message at the right time
* Designers and marketing anagers use our Drag and Drop [email editor](editor-layout) to produce a compelling email templates
* Marketers can tweak styles and content any time, without developer involvement

> Our Transactional Email Service gives you separation of responsibilities: everyone does what they do best at the time of their choosing!


## Design a template

Use our [editor](editor-layout) to design all of your transactional messages. 

Our responsibilities are:

* Compatibility of your messages with various email clients
* Messages will be automatically responsive
* Inlining CSS
* Unlimited image hosting
* Generation of valid HTML
* Merging your dynamic values into templates
* Tracking links

Check out the  how to [create and edit templates](creating-and-editing-template)


**The left image is a template, and the right one is a complete merged/sent message.** 


![](images/transactional3.png)

## Submit to API 

Just submit this JSON document to trigger sending a message.

~~~~ {.js .numberLines}
{
    "template_id": 123,
    "reply_to": "john@turncoat.com",
    "from": "John Doe",
    "to": "jane@doe.com",
    "subject": "Hera collection arrived!",
    "merge_fields": {
      "status": "NEW THIS WEEK",
      "collection": "HERA COLLECTION",
      "custom_action": "Find the style to match any occasion"
    }
}
~~~~


[See the API for sending a single message](transactional-send).


## Personalization

Sending Transactional emails requires that templates for these messages are created prior to sending.
Such templates can have merge fields, in a format `${field_name}`. This feature allows a high degree of flexibility
for message customization.

> The template to be sent can have a number of merge fields, with data for merging dynamically provided during an API call.

## First steps

You can start from scratch and start your first message in a couple of minutes. Follow this
[step by step tutorial](transactional-step-by-step) to see how.

## Rate limiting

Transactional API is a subject to [Rate limiting](rate-limiting), like any other API. 

