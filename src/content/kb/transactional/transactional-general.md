# Transactional messages concepts


Transactional emails are sometimes called triggered emails. Unlike bulk emails, they are sent one at the time on per 
need basis and contain highly personalized content. Examples of triggered emails can be one-off messages, such as password reset, 
statement generated, etc.

## Built as REST API

We offer a simple [REST](https://en.wikipedia.org/wiki/Representational_state_transfer)- based API
for [sending messages](transactional-send) and for [getting reports](transactional-reporting-for-single-message).



## Use out powerful editor for templates

Unlike most other transactional ESPs, we built our transactional email service around our [email editor](editor_layout).
Using the editor removes a lot of issues from managing internal HTML code and saves _time and money_:

* Developers' are responsible for triggering the right message at the right time
* Designers use our Drag and Drop Editor to produce a compelling email template
* Marketers can tweak styles and content any time, without developers involvement

> Our Transactional Email Service gives you separation of responsibilities: everyone does what they do best at the time of their choosing!


### Design newsletter

Use our [editor](editor_layout) to design all of your transactional messages, while our responsibilities are:

* Compatibility of your messages with various email clients
* Messages will be automatically responsive
* Inlining CSS
* Hosting images (unlimited hosting)
* Generation of valid HTML
* Merging your dynamic values into templates
* Tracking links

Check out the  how to [create and edit templates](creating_and_editing_newsletter)


**The left image is a template, and the right one is a complete merged/sent message.** 


![](images/transactional3.png)

### Send with API

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


### Messages

Sending Transactional emails requires that templates for these messages are created prior to sending.
Such template can have merge fields, in a format `${field_name}`. This feature allows a high degree of flexibility
for message customization.

The template to be sent can have a number of merge fields, with data for merging dynamically provided during a call.



## First steps

You can start from scratch and start your first message in a couple of minutes. Follow to
[step by step tutorial](transactional-step-by-step) to se how.
