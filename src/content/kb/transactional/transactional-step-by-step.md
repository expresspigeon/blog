# Send a message - step-by-step


## Step 1: Create a template

First, use our editor to [create a template](creating-and-editing-newsletter). 
Simply type a dynamic merge field (placeholder) into a template in this format: 

    ${first_name}


Below is the editor with a very simple template:

    
![](/kb/images/Selection_749.png)
    
> Note the template ID (from the URL) - you will need it soon!
    
    
## Step 2: Get your Authentication Key

Navigate to your [Integrations page](https://expresspigeon.com/settings/integrations) and grab your
 Production Authentication Key:

![](/kb/images/Selection_748.png)


## Step 3: Send!

Form a [Curl](https://en.wikipedia.org/wiki/CURL) request and add your values: 

~~~~ {.prettyprint .numberLines}
curl -X POST -H "X-auth-key: XXXXX"
    -H "Content-type: application/json"
    -d \
    '{
        "template_id": 123,
        "reply_to": "john@example.net",
        "from": "John",
        "to": "jane@example.net",
        "subject": "First transactional message!",
        "merge_fields": {
            "first_name": "John"
            }
    }'
'https://api.expresspigeon.com/messages'
~~~~


where: 

* XXXXX is your Production Authentication Key
* 123 is an ID of your template (replace for real value)

.. and the rest of the values should be obvious!

Simply execute this code on the terminal to send a message. For simplicity you can wrap it into a script file.

## Read the message

When delivered, the message will look as expected:
 
![](/kb/images/Selection_750.png)

Next, you can proceed to [full documentation on sending a single message](transactional-send).