# Transactional messages concepts

<ul data-toc data-toc-headings="h2,h3,h4"></ul>


## General concepts

Unlike most other transactional ESPs, we built our transactional email service around our email editor.
Using the editor alleviates a lot of issues from managing internal HTML code and saves time and money:

* Developers' are responsible for triggering the right message at the right time
* Designers use our Drag and Drop Editor to produce a compelling email template
* CMOs and management can edit copy and content any time, without developers involvement


### Design newsletter

Use our editor to design all of your transactional messages, while our responsibilities are:

* Compatibility of your messages with various email clients
* Messages will be automatically responsive
* Inlining CSS
* Hosting images (unlimited hosting)
* Generation of valid HTML
* Merging your dynamic values into templates


~~~~ {.designcode .numberLines}
YOURCOMPANYLOGO
Hi, ${first_name}!
Your statement is ready to review online!
~~~~

### Send with API

Just submit this JSON document to trigger sending a message.

~~~~ {.js .numberLines}
{
    "template_id": 123,
    "reply_to": "john@acme.com",
    "from": "John Doe",
    "to": "jane@doe.com",
    "subject": "Statement ready",
    "merge_fields": {
      "first_name": "Jane"
    }
}
~~~~

### Result

~~~~ {.designcode .numberLines}
YOURCOMPANYLOGO
Hi, Jane!
Your statement is ready to review online!
~~~~

Transactional emails are sometimes called triggered emails. Unlike bulk emails, they are sent one at the time on per need basis and contain highly personalized content. Examples of triggered emails can be one-off messages, such as password reset, statement generated, etc.

Our Transactional API is a set of HTTP REST end points designed for implementation with external systems in order to send email as well as retrieving reporting data.

### Messages

Sending Transactional emails requires that templates for these messages are created prior to sending.
Such template can have merge fields, in a format `${field_name}`. This feature allows a high degree of flexibility
for message customization.

The template to be sent can have a number of merge fields, with data for merging dynamically provided during a call.





## Built as REST API

We offer a simple [REST](https://en.wikipedia.org/wiki/Representational_state_transfer)- based API
for [sending messages](transactional-send) and for [getting reports](transactional-reporting-for-single-message).

## First steps

You can start from scratch and start your first message in a couple of minutes. Follow to
[step by step tutorial](transactional-step-by-step) to se how.



