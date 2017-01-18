# Security and Authentication

All API calls are secure and protected by SSL encryption and our HTTPs certificate.

In order to ensure authentication and authorization, all calls require so-called Authentication Key. This value must be provided as an HTTP header for POST, PUT and DELETE methods.

For GET requests, you have an option to provide it as an HTTP header, or as a request parameter. This is done for convenience, since it allows to play with GET requests using a browser.

Request parameter authentication key name: `auth_key` Authentication header name: `X-auth-key`

Location of the Authentication key is: Settings → Integrations, or directly at: [Integrations](https://expresspigeon.com/settings/integrations).