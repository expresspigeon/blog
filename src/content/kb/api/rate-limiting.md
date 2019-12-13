# Rate limiting

## Introduction

Our API has a built-in protection from accidental (or intentional) abuse by 
customers sending too many requests too fast.
 
Generally, when integration with any external API, the developer should be looking at error codes in case 
a request is not successful.
 
Rate limiting applies to all API, such as [Transactional Messages](transactional-general), [Campaigns](campaigns), etc.

## Error response 

If you are sending too many requests, you will get the following error:

```json
{"status":"error", "code": 503, "message":"too many requests"}
```

When that happens, you need to slow down and re-submit the request. 


## Current rate limit
 
At the time of this writing (December 2017), the current rate limit is 150 requests per 5 seconds.
This value may fluctuate with time as load increases or we add more hardware to process requests.


## Transactional messages rate limit

Rate limit for sending transactional messages is configured separately and right now (December 2019) is 900 requests per minute.
