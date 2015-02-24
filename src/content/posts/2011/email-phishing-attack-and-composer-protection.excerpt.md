
A few years ago  the world of email has been swamped by the so-called
[phishing attacks](http://en.wikipedia.org/wiki/Phishing#Link_manipulation).  Most of these were using a simple technique of
placing an HTML anchor text that led a reader believe that the link
would take them to a legitimate site, while the `href` value of the
anchor pointed to the attacker&apos;s website. Here is an
example:` <a href=&apos;http://citibank.foo.com&apos;>http://citibank.com</a>`While this displays an innocuous link:
[http://citibank.com](http://citibank.com)
it in fact points to a potential attacker&apos;s website.

The ExpressPigeon platform has a built-in mechanism for tracking clicks
originating from emails.