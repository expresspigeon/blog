# Flow conditions

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
 
----

Continue to [Flows actions](flows-actions).