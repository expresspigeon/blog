![](${blog_base_url}/images/2014/dmarc1.png)


[DMARC](http://en.wikipedia.org/wiki/DMARC "DMARC") stands for
*Domain-based Message Authentication, Reporting and Conformance* and it
is yet another technology trick ISPs and ESPs use to ward off SPAM in
addition to
[SPF](${blog_base_url}/2012/01/18/spf-in-plain-english-and-a-few-internet-terms/ "SPF in plain English")
and
[DKIM](${blog_base_url}/2012/04/18/dkim-in-plain-english-and-a-few-internet-terms/ "DKIM in plain English").
DMARC is a configuration of a domain record that tells the receiving
computer what to do with messages if they are coming from a computer
with a different domain compared to the one specified on the "Reply To"
field. For instance, at
[](http://expresspigeon.com ) we configured
our DMARC policies such that if someone else sends an email from their
computer (which cannot have our domain), but set the Reply To as:
"jack.the.intruder@expresspigeon.com", then the accepting computer
should report this incident to us. So far so good? Well DMARC - being a
relatively new technology - has been used sparingly for some time.
Different companies were doing pretty much the same as us: just
reporting these incidents. This changed in April 2014 when Yahoo! took a
deep dive into DMARC requiring receiving computers to [reject emails if
they are not sent from Yahoo!
computers](https://help.yahoo.com/kb/mail/SLN24016.html). Soon [AOL
followed the path after
Yahoo!](http://postmaster-blog.aol.com/2014/04/22/aol-mail-updates-dmarc-policy-to-reject/),
which means you also cannot use AOL-based return addresses.

## How does DMARC affect email marketers?

If you are sending emails from our servers (or if you are using any
other ESP), and you use your personal Yahoo! (or AOL) email as a "Reply
To", then most ISPs like Microsoft, Google etc will simply reject your
emails because Yahoo asked them to! The solution to this is to use your
corporate email address. Yahoo! and AOL logic is easy to understand:
they provide free email service to individuals. If an email address they
provide is also used to send mass emails from another ESP, than this is
kind of a violation of the agreement on your end (I&apos;m not a lawyer, do
not hold my feet to the fire:)). Instead of sending from
miketheblogger@yahoo.com, you will have to switch to
mike@miketheblogger.com to solve this problem.

## Bottom Line

If you are sending mass email on behalf of your company, use your
corporate email for this. If you are a blogger, and represent yourself
then take this opportunity to get your own domain and build a better
brand for yourself! Happy emailing!
