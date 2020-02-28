# Flow modes

A flow might be in two modes: 

* Edit - you can edit the flow, but the flow is not operational
* Run - the flow is operational and you can edit some properties of a flow.

![](/kb/images/flows/flow-modes.png) 
 


## Switching from Edit to Run

While you are working on your flows, they are in the "Edit" mode. 
Once you are comfortable with your logic, you can  switch the flow from the Edit to Run mode. 

When you turn the flow into a Run mode, the Flow Validation triggers to check that your flow components
have all been set. If something is missing, the actions and conditions that did not pass validation will 
highlight in red and *the flow will not switch to a Run mode*. 


## Switching from Run to Edit

When your flow is Run mode, tou can edit some properties, such as change the message subject, but you 
cannot edit any major parameters, such as timers, actions, etc. 

> When you switch from Run to Edit mode, all existing timers that will trigger in future will be canceled.

As such, please ensure it is what you want to do.
