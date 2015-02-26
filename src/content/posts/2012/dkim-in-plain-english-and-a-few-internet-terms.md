In the previous article [SPF in plain English](spf-in-plain-english-and-a-few-internet-terms), I explained SPF. In
this post, I&apos;ll discuss DKIM. Since this is a fairly involved computer
process, I have to prepare you by explaining [Public Cryptography](http://en.wikipedia.org/wiki/Public-key_cryptography) and
[Digital Signatures](http://en.wikipedia.org/wiki/Digital_signature). Don&apos;t be scared, this is just a logical
explanation and there is no math involved (refer to the title). :)

Public Cryptography is a process of encryption that involves two keys
(or a key pair), as opposed to one. One of the keys is Private and is
kept secret, while the other is Public and can be published. The keys
have a special relationship with each other. If a piece of data is
encoded with one key, it can only be decoded with the other, and vice
versa. This may seem counter-intuitive. If you use a Private Key to
encrypt data, you cannot use the same key to decrypt it! You must use
the Public Key.

I also have to introduce you to [Message Digests](http://en.wikipedia.org/wiki/Message_digest). A Message Digest is
a string of characters, of fixed length, that has been generated from
some content. It just happens to be unique to that specific piece of
content. For example, suppose I have an article, and that I generate a
Message Digest for it. If I make a tiny change in the article (say,
change one letter, or add a dot) and then generate a new Message Digest,
it will be quite different from the first one.

The last concept I need to explain is that of a Digital Signature. A
Digital Signature is a Message Digest, encoded with a Private Key. If I
have a document, generate a Message Digest, and then encode it with my
Private Key, I end up with a Digital Signature for that document. So
what is a digital signature, really? Well, it serves the same purpose as
a hand-written signature; it ensures that a person who applies a
signature to a document cannot deny doing so at a later date.

In order to verify a digital signature, one needs to perform the
following steps:

1. Generate a Message Digest from the document.
2. Decode the Digital Signature with the signer&apos;s Public Key (remember, this is a corresponding key).
3. Compare the Digest that was generated with the Digest that was decoded;
if they match, then the signature is verified and the signer cannot deny signing.


Now that we&apos;ve tackled the digital security mumbo jumbo, we can proceed
to DKIM. The process is quite straight forward:

-   A Key Pair gets created
-   The Private Key is configured on the sending e-mail server
-   The Public Key is configured on the DNS record of the sending server
    (this is done with the tools of the DNS registrar, such as GoDaddy
    and others)

This is enough to get started. Once the Private Key is configured, the
sending server will sign certain fields of the outgoing e-mail with its
Private Key, and attach the signature to the e-mail as one of the
headers.

Here is an example of an ExpressPigeon signature:  

` DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=key1; d=epsrv1.net; b=zjOA7h/6xV8gsbd0TWjmD/lA+aShS5ylIakb5TxUqHA/IaeZ0aQDa4GD8WlY0c4Pl3P1MizlhjYZ EF9RehHHOQ==`



You can observe signatures in every e-mail that you receive from us.

On the other end, the receiving e-mail server will lookup the sender&apos;s
Public Key from its DNS record and will proceed to validate the
signature. If the signature is validated, then there is a guarantee that
the e-mail came from that sender.

DKIM is a very good mechanism to validate the identity of a sending
system. This is yet another piece of technology that makes the Internet
just a bit more safe!

Nowadays, it is considered good manners to implement both SPF and DKIM,
in order to present yourself as a good e-mail citizen. [ExpressPigeon](http://expresspigeon.com)
does both, of course.

Cheers,

Igor

