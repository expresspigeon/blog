# Editor Layout

<title > this is a comment!</title>

## Main Editor Components


Take a look at the image below to see the most important email editor components.

![](images/Selection_645.png)


Want to see this in action? Watch the [Basic structure](/kb/creating-and-editing-template#basic-structure)
video clip.



## Template Header

The Header contains three elements:

* [Teaser](https://expresspigeon.com/blog/2012/12/14/increase-email-open-rates-with-a-teaser-line)
* [Unsubscribe link](#unsubscribe-links)
* [View online link](#view-online-link)

Clicking on the Header will make the Header Properties panel display on the left. You can set the
Teaser and toggle the links in the properties panel.

![](images/Selection_469.png)

### Unsubscribe Links

The CAN/SPAM act requires unsubscribe links in all bulk messages, and also requires that unsubscibes be
removed from the mailing within 10 business days. We suppress all unsubscribes immediately.
Transactional messages do not require unsubscribe links as they are considered important system updates.

### View Online Link

The View Online link allows the user to display the email in a web browser in the event that there is a problem with their email client.
Everything in the browser view will display exactly as you would see it in the email. The View Online link can be toggled
on and off in the properties panel of the editor. It is recommended that you have it turned on.


> The View Online link will not work for test emails sent with a Quick Send button


## Template Footer


The Footer contains your address as required per the CAN/SPAM act.
The address in the footer should reflect the actual physical address of the sender.

![](images/Selection_476.png)

### Physical Address in the Footer

Addresses are list-specific and can be changed under _Contacts_ by clicking _Properties_ on the desired list,
then clicking _Physical Address_ from the left column on that screen.

> When sending, the address of the target list is used, regardless which address is displayed in a footer
during editing. You can provide different addresses for each list. Editing the address on the account settings
 has no effect on list addresses.

### Unsubscribe Link

The unsubscibe link in the footer can not be removed as it is required to comply with the CAN SPAM Act.
If you have a *very* good reason to remove it,
please send us a [support request](https://expresspigeon.com/support).


## Location of Unsubscribe Links

When creating a template, the unsubscribe link will be present in the Header, as well as the [Footer](#footer). The unsubscribe link in the
header can be disabled (as shown above), but due to CAN/SPAM  Act the unsubscribe link in the footer cannot be removed.
ExpressPigeon recommends making unsubscribing as easy as possible by keeping both links present, which will also have a positive impact on deliverability.

If you maintain your own preferences page and really want to remove the ExpressPigeon unsubscribe link from templates,
 please submit a request to [Support](https://expresspigeon.com/support).


## Row Menu


When a content block is selected (by clicking into it), the Row Menu  will display just above it. With the Row Menu
you can:

* Move internal content blocks left and right
* Drag the entire row up and down
* Add an empty row just above the current one
* Make a copy of the current row
* Delete the row

Go to [Moving Content](/kb/creating-and-editing-template#moving-content) to learn how to move content
around.


![](images/Selection_633.png)


## Global and Local Styles

Within the editor you can set Global Styles that affect the whole template as well as Local Styles for individual blocks.

> Local Styles always override Global Styles.

![](images/Selection_475.png)

### Global Styles

The Template tab in the Properties Panel contains a Global Style Editor. Here you can set the standards for your entire template
including things like background color, background image, etc.

> If you set styles for Header 1 or Header 2 in the Global style editor, they will apply to all respective headers across the template.
Same goes for text and links.

### Local Styles

The Local Editor is displayed directly underneath the currently selected content block. Here you can make edits to the content within that specific block.

## Setting the Language

If you send internationally, you can set the language for your Unsubscribe/View Online links.
This not only changes the language of the visible links, but also the entire unsubscribe flow.

> If a recipient gets an email with a Chinese unsubscribe link and clicks it, the recipient will then be taken to an ExpressPigeon
unsubscribe page which will tell them, in Chinese, that they’ve unsubscribed.

Currently we support about 60 languages.

![](images/Selection_472.png)



## Next Steps

Once you master the general concepts of the editor, you can proceed to
[creating and editing templates](/kb/creating-and-editing-template), where you'll find several short video
 clips to help you get up to speed quickly.
