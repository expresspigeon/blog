# Campaigns

Campaign API provides the same service as sending email campaigns from the website. A campaign consists of newsletter template, subject, from name, reply to, and a lists of contacts a campaign can be sent to.

## Campaigns creation

> POST https://api.expresspigeon.com/campaigns

Creates a campaign. Invocation of this API will trigger sending or scheduling a new campaign. The content type of a request must be *application/json*.

**Request parameters**

