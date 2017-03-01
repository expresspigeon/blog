# Routing of Transactional Messages

We provide an easy three step process to let you prepare sending production messages. These are:

* Sending to blackhole
* Sending to a test email address
* Sending to a real email address

## The Black Hole!

Yes, ExpressPigeon has a blackhole! If you send your messages to `blackhole@expresspigeon.com` using our API,
the message will not be actually sent. Use this feature to learn now to integrate with our API to send messages,
but not exactly send them.


## Sending to a sandbox address

The next step after blackhole, is to start sending real messages. Each API call requires using the Authentication Key,
but if you use a Sandbox [Authentication Key](security_and_authentication), the messages will be delivered to
the Sandbox Destination email.

In order to access the Authentication Keys in your account, navigate to the [Integrations](https://expresspigeon.com/settings/integrations)
page.

![](images/sandbox-key.png)

## Sending to actual addresses

When you are comfortable to send to yourself after the integration, just replace the Sandbox Authentication Key for **Production Authentication Key**, 
and messages will be delivered to real people!
