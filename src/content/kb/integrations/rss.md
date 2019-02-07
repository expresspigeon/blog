# RSS Feed

RSS Feed integration allows you to automatically insert RSS feed content into the template. We will check for updates on your RSS feed once per hour. When you accumulate a configured number of new posts, we will send a new campaign automatically.

First you need to configure your template. 

Open a template you want to be used and insert a placeholder `${rss_content}` where you want RSS content to be displayed.

![](/kb/images/rss_1.png)

After that, please navigate to the [Integrations](https://expresspigeon.com/settings/integrations) page and
press ope the RSS Feed Integration tab.

![](/kb/images/rss_2.png)

We have the following settings for this integration:

* Your RSS URL - URL of your RSS feed (e.g. https://www.nasa.gov/rss/dyn/Gravity-Assist.rss)
* Template to use for broadcast - this is template where you placed `${rss_content}`
* List to send to - contacts that will get this newsletter
* Items to include in one email - this should be a number of new items in RSS feed that we'll track before sending the campaign. Example: if this number is 5, it means our system will wait until 5 new records are added on the RSS feed, and only then we will include the five content blocks into your newsletter folowed by sending a campaign to your list.
* Email subject - subject of the your email



