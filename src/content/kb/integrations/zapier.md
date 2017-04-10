# Zapier

## Introduction

Zapier is a tool which allows users to connect various web apps.

An integration between two apps is called a Zap. A Zap is made up of a **Trigger** and one or more **Actions** or **Searches**.

Whenever a trigger happens in one app, Zapier will automatically perform the actions or searches in the specified app for that trigger, in order.

Here are couple examples:

* Get notifications in Slack when someone opened an email from specified ExpressPigeon campaign
* Add new Salesforce Leads to an ExpressPigeon contact list
* Send emails via ExpressPigeon to abandoned Shopify cart users

## What ExpressPigeon Triggers and Actions are Supported?

### Supported Triggers

* Contact Added To List - Triggers when a new contact is added/copied/moved to a specified contact list.
* Email Opened - Triggers when an email is opened in a chosen campaign.

### Supported Searches

* None yet!

### Supported Actions

* Suppress Contact - Removes a contact from all lists.
* Create/Update Contact - Add a new contact to a list, or update an existing contact.
* Send Transactional Email - Sends an e-mail using an existing template.

## How to Create First Zap with ExpressPigeon

To get started with ExpressPigeon on [Zapier](https://zapier.com), click the 'Make A Zap!' button.

![](images/zapier/zap_1.png)

In the 'Choose a trigger app' field enter 'ExpressPigeon' and select it.

![](images/zapier/zap_2.png)

As result you will see our list of available Triggers. Select the Trigger that you plan to use and click 'Continue' button.

![](images/zapier/zap_3.png)

At this stage you will need to connect your ExpressPigeon account. Click the 'Connect a new account' button. You should see new dialog window where you need to enter your ExpressPigeon API key.

![](images/zapier/zap_4.png)

Your ExpressPigeon API key can be found on our [Integrations apge](https://expresspigeon.com/settings/integrations).

![](images/zapier/zap_5.png)

After you've entered the API key and applied it, you should see 'ExpressPigeon Account #1' and 'Test' button at the right side.

![](images/zapier/zap_6.png)

Click 'Test' button and if you get 'Success!' this means you're all set and can proceed with configuring your zap.

## Ready to Use Zap Templates

A Zap template is a pre-defined and curated example of an automated workflow. ExpressPigeon is trying to save you time by creating Zaps with pre-mapped fields, so all what you need to do is simply connect two apps. 

### Location of ExpressPigeon pre-defined Zaps

There two places where you can find our templates:

* ExpressPigeon's [Zapbook](https://zapier.com/zapbook/expresspigeon/) Page
* ExpressPigeon's [Integrations](https://expresspigeon.com/integrations) Page

### Example how to use templates

Below you can find example of how you can easily configure Zap between Salesforce and ExpressPigeon.

- Open our [Integrations](https://expresspigeon.com/integrations) page and find needed Template, in our case 'Add new Salesforce Leads to an ExpressPigeon contact list'. Click 'Use this Zap' button.


![](images/zapier/zap_7.png)

- New dialog window will open with brief description what this Zap will do. All what you need to do is click 'Create this zap' button.

![](images/zapier/zap_8.png)

- Since it's pre-configured Zap, you will see that Salesforce trigger 'New Lead' already selected and all what you need to do is click 'Continue' button.

![](images/zapier/zap_9.png)

- Follow instructions and connect you Salesforce account. After you do this, you should see following:

![](images/zapier/zap_10.png)

- Note please that on next step you will need to have existing 'lead' under your Salesforce account. If you have this, just click 'Fetch & Continue' button. This is 'test' step, so don't be afraid - nothing will be created/changed.

![](images/zapier/zap_11.png)

- If all went OK in previous step, you will see that Saleforce part is all green and you can proceed to ExpressPigeon part.

![](images/zapier/zap_12.png)

- 'Create/Update Contact' action is already selected and you can click 'Continue' button.

![](images/zapier/zap_13.png)

- Connect ExpressPigeon account as described [above](#how-to-create-first-zap-with-expressPigeon). As result you should see following:

![](images/zapier/zap_14.png)

- On the next step you should configure what list on ExpressPigeon you want to use for this zap and also select 'field' from Salesforce that will be used as an 'Email'.

![](images/zapier/zap_15.png)

If you click 'Show advanced options', you will be able to configure all available fields for new Contact (First Name, Last Name and others).

![](images/zapier/zap_16.png)

- On the last step you will see previously configured data. Click 'Create & Continue' button. That's all, you are all set. Now, when you will have new lead created on Salesforce, it will automatically appear in your selected ExpressPigeon contacts list. You have more time for more pleasant things rather then manually migrating all this stuff.

![](images/zapier/zap_17.png)


