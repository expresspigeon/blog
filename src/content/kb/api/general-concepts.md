# General Concepts

The ExpressPigeon API uses HTTP requests for ease of integration. Such requests use HTTP methods: GET, POST,
PUT and DELETE. For GET requests, input values are supplied as standard query string parameters.
It should be easy to play with these using the address bar in browsers.

For POST, PUT and DELETE methods, you will need to send in a JSON document and expect a JSON document to
be returned back. In essence, our API can be explained as:

> JSON in / JSON out – REST API

As a result, for all cases when you need to send in JSON document, please set Content-type:
`application/json`, and expect the same as output.
