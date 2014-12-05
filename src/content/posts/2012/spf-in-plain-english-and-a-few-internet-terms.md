The world of e-mail is a treacherous one. Every day, millions of people
receive unwanted SPAM, whether it's product information that they never
requested, a bogus offer from a Nigerian prince, or something even
worse!

The Internet can be compared to a war; the defending side creates more
and more elaborate armor, while the offensive side develops increasingly
potent weaponry to penetrate that armor.

The two e-mail standards, SPF and DKIM, are like knights in shiny new
armor, designed to protect innocent e-mail readers from Internet
evildoers. :)

Analogies aside, I will first explain what SPF is and how it works, at a
high level. This is not an in-depth tutorial; for that, please refer to
the following websites: [SPF](http://www.openspf.org/) and [DKIM](http://www.dkim.org/).

SPF stands for Sender Policy Framework. The name does not tell us much,
so let's look deeper. SPF is designed to verify that the computer from
which an e-mail was sent is in fact what is claimed in the e-mail.

When a receiving server (your ISP, usually Hotmail, GMail, etc.)
receives an e-mail, it does the following:

-   Performs a reverse DNS lookup
    http://en.wikipedia.org/wiki/Reverse\_DNS\_lookup. This is a process
    of determining a sending computer's name from its IP address. A
    computer name is something we use all the time, such as
    [ExpressPigeon.com](http://expresspigeon.com).
-   Now that the receiving server has determined the name of the sending
    computer, it performs an SPF lookup in the DNS of the sending
    computer. This is to determine if the IP address of the sender is
    mentioned. For example, this is what the SPF record looks like for
    one of our sending servers:  
    `v=spf1 a mx ptr ip4:184.107.171.2 mx:epsrv1.net -all`As you can
    see, it includes the IP address: 184.107.171.2

This means that when we send from this computer, the receiving server
can do the aforementioned checks to validate that the e-mail came from
us. In other words, the receiver knows where to go to ask questions in
case there is a problem with e-mail content. This prevents the sending
of e-mail from anonymous computers. Of course, this does not prevent
sending of e-mail from servers without SPF records; in that case, it
just means that SPF record verification did not go through.

The receiving server can look at many factors, besides the SFP check.
Different ISPs have different policies on dealing with a failed SPF
verification.

As you can see, the SPF process makes us a bit more safe. The sending
servers can be determined using SPF, which makes it easier to go after
those responsible in case there is a problem.

Stay tuned for the next topic: DKIM!

Igor
