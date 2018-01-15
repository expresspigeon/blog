# Flows


## Introduction

Automation is the process of putting your marketing actions on autopilot. 
Frequently, marketing departments have to send targeted emails across multiple lists. 
ExpressPigeon automation makes this task easier, allowing marketers to save time and 
money by doing the grunt work in the background. 

ExpressPigeon automation allows you to prioritize and execute your marketing tasks 
in a more efficient manner by creating “Flows” that give each individual customer 
their own experience based on how they interact with a specific workflow. 

Automation takes traditional marketing email campaigns to the next level. 
If used correctly, you can send customized content and messaging to your 
lead segments and ultimately create more personalized experiences for your 
subscribers. This approach will help you to get more deals, bring in more 
revenue, and make your customers feel a more personal connection to you. 


## Terminology

* Automation - a way to automate tasks for a marketer
* Flow  - a system for creating, editing, viewing and executing automations
* Workflow is the same as Flow
* Conditions - way to branch execution of a flow
* Action - component that performs a unit of work within a flow

## Concepts

ExpressPigeon automations are implemented as a typical flowchart that 
people are accustomed to. As a flow chart it contains the Starting point, 
actions and conditions. The start looks like this:

![](images/flows/start.png)


Workflows always has a start component.
 
A condition is represented by a diamond component as is typical for flowsharts


![](images/flows/condition.png)


Conditions allow the workflow to branch execution of the workflow depending on data values for each individual customer. 
An action is represented by a purple rectangle:
 
![](images/flows/transactional-action-1.png)
 
 

Actions are designed to perform operations. Please, see below on types of actions. 
Each flow component can be configured by opening its Settings panel by clicking on the settings gear icon when clicked: 
 
![](images/flows/transactional-action.png)

> Execution of a flow is performed per contact and started by some trigger or a schedule. 

## Flow editor

<span style="background-color:yellow;"> TBD -</span>
 
* Editor elements
* Editor modes
* Show drag and drop scren capture  

## Conditions

Conditions are a way to create branching in a flow depending on customer data and behavior. 
Conditions allow you to determine further actions based on specific rule sets. Conditions use 
similar rules as our Segmentation system with some additional flow-specific decisions.



### Data - based decisions

Data based decisions allow you to create branch logic based on customer data. Here are some examples: 

* Person lives in XYZ zip code
* Person is between ages of 25 and 35
* Person is not retired
* Person is a manager

The condition tool we offer allows you to combine such rules in any way, exclusive and inclusive. 
You are also not limited by the number of decisions within a condition. 

Setting up conditions is easy: 

![](images/flows/condition-decisions.png)

Once all the decisions are set, they are displayed as a tooltip over a condition:

![](images/flows/flow-conditions.png)

### Behavior - based decisions

In some cases, you might want to branch your logic to a different flow based on the behavior of the customer. 
A typical example would be:
 
* Send a message to the customer
* Wait X amount of time
* Check if that email was opened
* If it was, perform one action, if not, perform another


Below is an example of setting up a rule like that


![](images/flows/conditions.png)

Behavior and data-based rules can be easily combined together to create powerful decisions for your business.
Here is an example if a workflow you can create  in a few minutes:

![](images/flows/flow-interactions.png)

First, it sends a welcome email, then it waits for 2 days and checks if that email was opened. 
If it was, it sends a “Tutorial #1” and if not, it sends a “Gentle reminder :)” message.


> You can use 'click' interactions in the same way as open ones.
 
 
## Actions

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


## Dry Run Mode

A Dry Run mode allows to visualize a path through a flow based on all conditions for a specific contact. 
All conditions will make decisions according to this contact’s data. The Flow will paint the path of 
execution by highlighting the arrows connecting conditions and actions in <span style="color:red">red color</span>. 

> No action will be executed in the Dry Run Mode. 

Use Dry Run to simply ensure that you put the right conditions in place.

![](images/flows/dry-run.png)

In order to try your Flow in a Dry Mode for a specific contact, please perform these steps:
 
1. Click the “Dry Run” button - this will open up a Dry Run execution panel
1. Enter an email of a contact that has data which is referred to in a condition
1. Click the Execute button and observe the execution paths highlighted through your flow

The Dry Run mode is great for visualization of your flow before you execute it.
 
 
## Starting Flows

Flows are executed on a per contact basis. There are many ways to start a flow for a contact. 
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
* Zapier action (<span style="background-color:yellow;"> VERIFY</span>) - adding a contact  to a list from a Zapier action

Whenever a contact is added to a list using any of these methods, a flow will trigger for each individual contact.

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

<span style="background-color:yellow;"> Zapier trigger - do we have that?Anything else?</span>

### Transactional message trigger

You can also start a flow for a contact if you send a transactional message to that contact and 
 he/she opens or clicks that message. 
 For more information,  please refer to [Transactional message flow usage](transactional-send#flow-usage). 