# Flows actions

An "action" is an element that performs some unit of work on the flows. See available actions below: 

###  Copy Contact Action

This action will copy a contact and place it onto a specified list. If you need to automatically 
segment your audience based on specific customer data or behavior, you can use this action is perfect for that. 
Basically, it will copy a contact from one list to another, creating a new target list for future use.
 
### Move Contact Action

This action will move a contact from their current list onto another list of your choice. 
This action is different from the “Copy Contact Action” only because the contact is deleted from the 
source list, whereas the “Copy Contact Action” will leave the contact on the source list.

### Send Transactional Message Action

This action will send a transactional message to your customer. You can design your transactional message 
using the ExpressPigeon editor, or code your own. 
For more information, see the [Email editor](/kb#email-editor) section. 

### Raise a “Zap Trigger Action”

This will initiate a trigger within Zapier. Zapier triggers, or “Zaps”, allow you to connect to over 
1000 apps for easy integration with ExpressPigeon. The “Zap Trigger Action” will send information on 
this specific contact to Zapier. If you have a Zapier account, you can connect this action to an external 
system, such as SalesForce, SurveyMonkey and others, making an Internet  ecosystem for your business. 
For more information, please refer to [Integrations](/integrations) page for more information.

### Time Delay Action

A Time Delay Action will delay the execution of a flow for a preset amount of time. Examples are: 

* Send a campaign
* Wait for 2 days
* Check if email was opened
* If not, perform action X
* If yes, perform action Y

### Future Time Action

A Future Time Action is similar to a time delay, but has a future time reference. For instance, it can be set to a time before or after an event in the future. Examples are: 

* 7 days before birthday
* 30 minutes after a future flight
* 2 days before appointment
* 1 day after hotel check-in 

Here is the Future Time Action settings dialog. It allows you to select a custom field 
that contains a time in the future for a customer, define a time difference from the custom field value 
and switch it to “before” or “after” that time: 


![](images/flows/delay-till-future.png)

> The format of the time field needs to be in the ISO format so as to 
eliminate time zone issues. Here is the format:  `YYYY-MM-DDThh:mm:ss+hh:mm`.

An example of a timestamp in Chicago ( - 6 hours from GMT) would look like this: 2018-01-10T10:24:33-6:00. 


Loading these values into your account is not any different than using custom fields. 
Please refer to: [Custom fields](contact-fields#custom-fields) page for more information.


### IMIconnect Action 

An IMIconnect Action allows to send a signal to a flow in [IMIconnect](https://www.imiconnect.io/). 


### Webhook action

Webhooks  are a way to integrate different systems in real time. 
The Automation Flow Webhook actions allow to send data in external customer systems. 

We allow flexibility in configuration of webhook content (payload, headers etc) as well as format. Generally, 
the format defaults to JSON, but you can edit the Payload  section of the Webhook to use any other format (CSV, XML, etc.). 
 
 
Here is an example of a webhook action configuration:

![](images/flows/webhook-action.png)

**Webhook parameters**

Parameter          Description         
-------------      --------------------
Name            	Name of your webhook action in the flow                  
URL        			Endpoint address where webhhok will send data.                 
Method              Currently we support only POST method.                 
Headers          	Configure as many headers as you need. Usually, you would use a header for authentication.                 
Payload           	What will be sent when this action executes.                 
Test            	Preview how payload will look like for your real contact.                 


### Manual Testing

> The **Test** section of the configuration allows you to manually send  and test the HTTP  POST  
request for a specific contact.

Simply enter any email address you have on the account,  press the "Preview" button and observe  the actual payload that 
will be sent to the external URL for this specific contact. 

In order to send the request to your webservice, click the button "Send test request" and observe the "Response" panel for 
any success or failure output     

This feature allows you to quickly test the integration before you set the Automation Flow to [Live Mode](/kb/flow-modes).  

### Webhook Errors

In case your API goes down and we are unable to execute the service calls, we log at most 500 errors to the [Error Log](/kb/webhooks-error-log). 
 

---

Continue to [Dry run mode](flows-dry-run).