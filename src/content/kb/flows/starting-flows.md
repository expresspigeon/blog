# Starting flows

Flows are executed on a per-contact basis. There are many ways to start a flow for a contact. 
Sometimes you start a flow for a specific contact based on some event, in other cases you may want 
to start a flow for a list of contacts. For more information on ways to start a flow read below. 

### Flow Settings

Clicking on the Settings button will open a Flow Settings panel and allow you to setup your flow:

![](images/flows/settings.png)


### Schedule

Scheduling a flow can be done on a per list basis. For instance, you can start a flow on a particular schedule such as:

* Once per week
* Once per month
* Every day at a specific time
* Indefinitely or for X number of times

In any case you set the schedule as it suits your business best.

![](images/flows/schedule.png)

> Whenever you set up a schedule, start with enabling such schedule by clicking 
on the “Enabled” toggle and selecting a list to operate against, 
before setting the actual schedule.

### Adding a contact to the list

You can trigger a flow for a specific contact whenever that contact is being added to a list. 

![](images/flows/added-to-list-trigger.png)

A contact can be added to a list by any of the following methods:

* Upload a CSV file into your account
* Manually type in contact details into a list
* Copy a contact from one list to another
* Move a contact from one list to another
* Zapier action - when adding a contact  to a list from a Zapier action

Whenever a contact is added to a list using any of these methods, a flow will trigger for each individual contact.

> A flow will start even if you are adding an existing contact to the list by any means. 

### Subscribed using a form

If you have a [subscription form](https://expresspigeon.com/subscriptions) you can connect a 
flow to it. Whenever a contact subscribes using that form, a flow will trigger for that contact. 
The form trigger configuration is accessible from the same flow settings panel.
 
![](images/flows/subscription-settings.png)

For more information on subscription forms please refer the page [Web forms](regular-web-forms). 

### Campaign trigger

A flow can be triggered for a contact based on that contact’s interaction 
with a campaign. When you are in the process of sending a campaign, you will 
have a choice of attaching a flow to that campaign. 

There are two choices of interaction with that campaign:

* Opened a campaign message
* Clicked on a link from a campaign message


![](images/flows/campaign-prepare.png)

> The system will not trigger the same flow for the same contact within 
> the same campaign more than once. Even if the email is opened multiple times, 
> the flow will only trigger on the first event and not on any subsequent open events.


### API trigger

Your developers can also trigger flows for a specific contact using our API. 
This allows you, the marketer, to control the logic of your business without 
involving developers once the integration is in place. For more information 
please refer to this page: [Flows API](flows-api).

If you have any additional questions please reach out to us on https://expresspigeon.com/support.


### Transactional message trigger

You can also start a flow for a contact if you send a transactional message to that contact and 
 he/she opens or clicks that message. 
 For more information,  please refer to [Transactional message flow usage](transactional-send#flow-usage). 