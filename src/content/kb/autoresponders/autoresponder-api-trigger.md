# API trigger 

You can use our API to trigger autoresponders for extremely precise delivery based on recipients' interests.

## Configuration

Navigate to the Autoresponders page and click 'Create new autoresponder' button, provide a name
and select a 'API trigger' as a trigger.  

![](images/autoresponders/responder_7.png)

After this basic information is entered, you will be able to configure autoresponders' details:

![](images/autoresponders/responder_8.png)

Let check what options you can control:

* **API Trigger** - An API event triggers this autoresponder.
* **Reply to** - Email for your subscribers to reply to.
* **From name** - Name of sender (your or your organization). Subscribers will see emails as coming from this name.
* **Enabled** - Toggle that allows you to enable/disable autoresponder.
* **Delay rules** - Configure as many autoresponder messages as you need. 
    * _Then wait for_ - amount of time you want us to wait before sending the next message
    * _Start with_ - newsletter template you want to send
    * _With Subject_ - email subject

**Example:**

From the screenshot above, the following events will happen: 

* API triggers and autoresponder
* The system waits for 2 hours
* The system sends out a newsletter "Follow Up Email" with subject "Thanks for joining us!"
* The system waits for 1 day 
* The system sends out a newsletter "Follow Up Email 2" with subject "Great opportunity."
 'Great opportunity'. 

