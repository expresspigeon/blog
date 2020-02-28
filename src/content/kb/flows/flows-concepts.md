# Flows concepts

ExpressPigeon automation flows are implemented as a typical flowchart that 
people are accustomed to. As a flow chart it contains the Starting point, conditions and  
actions. The start looks like this:

![](images/flows/start.png)


> Flows always have a start component.
 
A condition is represented by a diamond component as is typical for flowsharts


![](images/flows/condition.png)


Conditions allow the workflow to branch execution of the workflow depending on data values for each individual customer. 
An action is represented by a purple rectangle:
 
![](images/flows/transactional-action-1.png)
 
 

Actions are designed to perform operations. Please, see below on types of actions. 
Each flow component can be configured by opening its Settings panel by clicking on the settings gear icon when clicked: 
 
![](images/flows/transactional-action.png)

> Execution of a flow is performed per contact and started by [some trigger](starting-flows) or a schedule.   

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
 
----

Continue to [Flows conditions](flows-conditions).