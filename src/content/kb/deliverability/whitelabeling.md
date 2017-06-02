# IP Whitelabeling 

IP Whitelabeling is a process of tying a sending  domain to a sending IP address.
There are three email technology standards that make help ISPs relate sending domains 
and sending IP addresses: SPF, DKIM and PTR 
 
 
> A sending domain is a part of the "Reply to" email address

For instance, if you are sending from `john@example.com`, then the sending domain is 
`example.com`.
 
## "VIA" and other warnings
 
In a typical scenario, our customer would use their sending domain, but the messages will be 
delivered from our IP addresses, and our domains associated with those IP addresses. 
Our typical domain would look like: `smtp0021.epmailer.net`. When an ISP received such a message, 
they quickly figure out  that your sending domain and our domain associated with the sending IP are not the same. 

When this happens, different ISPs will display a warning. For instance, Gmail will display a so-called "via" message. 


![](images/via-message.png)

 
The point of this message is  this: the sending domain is `venturepulse.org`, but the email came from IP address 
 associated with domain `cmail.com`. 

If you want to learn more about Gmail VIA, read [Extra info next to sender’s name](https://support.google.com/mail/answer/1311182?hl=en). 


## DKIM

You can read our article [DKIM in plain English](https://expresspigeon.com/blog/2012/04/18/dkim-in-plain-english-and-a-few-internet-terms)
to learn more about DKIM.

## SPF

The SPF article [SPF in plain English](https://expresspigeon.com/blog/2012/01/18/spf-in-plain-english-and-a-few-internet-terms)
 will help you learn about SPF
 
## PTR

The PTR is also known as [Reverse DNS Lookup](https://en.wikipedia.org/wiki/Reverse_DNS_lookup). 
It is a mechanism that allows ISPs to lookup a domain associated with an IP address 
(as opposed to looking up the IP address for a domain, hence the "reverse" lookup).
 
## What we do

Our service includes configuration of DKIM, SPF and also PTR for better deliverability. 
If you are interested in whitelabeling of our IP addresses for your sending domain, let us know 
on our [Support line](https://expresspigeon.com/support) and we will walk you step by step, 
ensuring  you are properly setup. 
