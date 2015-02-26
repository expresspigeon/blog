
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
[ExpressPigeon](http://expresspigeon.com "ExpressPigeon") we configured
our DMARC policies such that ...