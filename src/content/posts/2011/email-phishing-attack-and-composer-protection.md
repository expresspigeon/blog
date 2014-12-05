Title: Email phishing attack and Composer protection
Date: 2011-12-21 21:07
Author: Igor Polevoy




A few years ago  the world of email has been swamped by the so-called
[phishing attacks](http://en.wikipedia.org/wiki/Phishing#Link_manipulation).  Most of these were using a simple technique of
placing an HTML anchor text that led a reader believe that the link
would take them to a legitimate site, while the `href` value of the
anchor pointed to the attacker's website. Here is an
example:` <a href='http://citibank.foo.com'>http://citibank.com</a>`While this displays an innocuous link:
[http://citibank.com](http://citibank.com)
it in fact points to a potential attacker's website.

The ExpressPigeon platform has a built-in mechanism for tracking clicks
originating from emails. This is implemented by replacing the `href`
values in the emails with values which point to part of our site
responsible for tracking. For example, if you add this link:  
`<a href='http://yourwebsite.com'>Your Site Description</a>`
We then replace it with this:  

`<a href='http://worker.expresspigeon.com/click?v=kz7...'>Your Site Description</a>`

When a person clicks this email, we capture the click and then forward
it to your original location: `http://yourwebsite.com`.However, if you provide a link where the *text of the link is a URL*,
this  will present a problem. Lets say your link looks like this:  
`<a href='http://yourwebsite.com'>http://yourwebsite.com</a>`
After we sent it to your recipients, it will have an `href` attribute
replaced:  

`<a href='http://worker.expresspigeon.com/click?v=kz7...'>http://yourwebsite.com</a>`
This will look exactly like a phishing attack, and your ISP and
potentially emal client will flag this email as dangerous, and the you
as spammer and hacker.

In order to avoid this, the [ExpressPigeon Composer](https://expresspigeon.com/gallery) does not allow to
create links with URL values as text. In other words, when you try to
add a new link to your email and then the text of your link is a URL,
composer displays this message:  
“Selected text can't be used in link. Please use descriptive text
instead of plain link.”

If you think of it, it makes a whole a lot of sense, even for end users.
Why display URLs as link text instead of human-friendly text? By
requiring marketeers to provide friendlier links, we allow them to avoid
being flagged as a hacker on the one hand, while seamlessly adding an
important feature on the other!

Email with pleasure.
