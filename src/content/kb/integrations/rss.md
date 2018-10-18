# RSS Feed

RSS Feed integration allows you to automatically insert RSS feed content into the newsletter. We will check for updates on your RSS feed once per hour. When you accumulate a configured number of new posts, we will broadcast them to your list automatically configured number of new posts, we will broadcast them to your list automatically

First you need to configure your newsletter. 
Open newsletter you want to be used and insert ${rss_content} where you want RSS content to be displayed.

![](/kb/images/rss_1.png)

After configured your newsletter, please navigate to the [Integrations](https://expresspigeon.com/settings/integrations) page and
press RSS Feed Integration button.

![](/kb/images/rss_2.png)

We have the following settings for this integration:

* Your RSS URL - URL of your RSS feed (e.g. https://www.nasa.gov/rss/dyn/Gravity-Assist.rss)
* Newsletter to use for broadcast - this is newsletter where you placed ${rss_content} tag and that will be used for sending
* List to send to - contacts that will get this newsletter
* Items to include in one email - this should be integer amount of new items in RSS feed that we'll track before sending the campaign. Example: you configure this to be 5, this means our system will wait when 5 new records will be added on the RSS feed, and only after this we'll insert them automatically into the newsletter and send to the contact list.
* Email subject - subject of the your email



