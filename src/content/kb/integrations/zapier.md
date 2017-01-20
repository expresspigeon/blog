# Zapier


## Introduction

Zapier is a tool which allows users to connect together web apps.

An integration between two apps is called a Zap. A Zap is made up of a **Trigger** and one or more **Actions** or **Searches**.

Whenever the trigger happens in one app, Zapier will automatically perform the actions or searches in another app in order.

Here are couple examples:

* Get notifications in Slack when someone opened an email from chosen ExpressPigeon campaign
* Add new Salesforce Leads to an ExpressPigeon contact list
* Send emails via ExpressPigeon to abandoned Shopify cart users

## Simple text

Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam
eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam
voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione
voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet consectetur adipisci[ng]
velit, sed quia non numquam [do] eius modi tempora inci[di]dunt, ut labore et dolore magnam aliquam quaerat voluptatem.
Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi
consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur,
vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?

## Text compoments

Bullets:

* one
* two
* three

Numbers:

1. one
2. two
3. three


Bold:  **bold**

Italic: *italic*

Links: [ExpressPigeon](http://expresspigeon.com)




## Image

Images need to be:

* Scaled down to the width of layout.
* You need to implement something so that when an image is clicked, the user will see the image at 100% resolution.
It might be a dialog. Is there anything in Bootstrap or material Framework for this?


![](images/Selection_457.png)



## Code

Here you need to write some JavaScript code to form the tabs for Bootstrap based on
content inside the div/tab-content. Please as Sasha to help you with this.


In addition, the code needs to be highlighted properly. Use the same method as we did in JavaLite site.
 We are using Pandoc to generate code snippets, so this will mean that every part of the code will have the
 CSS classes set appropriately.


<div class="tab-content">

<div role="tabpanel" data-language="Curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X POST -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
    -H "Content-type: application/json"\
    -d '{
        "list_id": 11,
        "contacts": [{
        "first_name": "John",
        "last_name": "Doe"
    }]
}'
~~~~

</div>

<div role="tabpanel" data-language="Java" class="tab-pane active">

~~~~ {.java .numberLines}
List<Person> people = Person.where("first_name = 'John'");
Person aJohn = people.get(0);
String johnsLastName = aJohn.get("last_name");
~~~~

</div>

</div>




## Blockquote

> This is a Blockquote, needs to be displayed properly


## Table


Tables need to have the same styling as in the API pages


HTTP method       path                  controller
-------------     --------------------  --------------------------------
GET               /books                app.controllers.BooksController
GET               /books/new\_form      app.controllers.BooksController
POST              /books                app.controllers.BooksController
GET               /books/id             app.controllers.BooksController
GET               /books/id/edit\_form  app.controllers.BooksController
PUT               /books/id             app.controllers.BooksController
DELETE            /books/id             app.controllers.BooksController


