# Error Codes & Responses

The ExpressPigeon API uses JSON format and returns appropriate HTTP response code for every request and response. 
When the ExpressPigeon API returns error message there is a meaningful explanation why the error is occurred. 

Most JSON documents returned as a response to an error condition also include HTTP status code in the body of 
JSON document for convenience.

Code              Text                   Description
-------------     --------------------   --------------------------------
200               OK                     Successful request
400               Bad Request            The request is invalid. See an error message for more details.
403               Forbidden              The request is understood, but access is not allowed because of missing or incorrect  "X-auth-key" header or "auth_key" parameter.
404               Not Found              Requested URI or a resource not found
500               Internal Server Error  In rare cases, there can be an issue with our API. If this happens, please [write to us](/support) so that our team can investigate and fix the issue.



## Error response format
                
The format will always in the JSON format: 

```json
{  "status":"error",
   "code":404,
   "message": "template=388 not found"
}
```

Even though the code 404 will also be returned as an HTTP header, it is also included in the JSON response object. 

> Developers should always inspect the `code` and ensure that non-200 codes are processed accordingly.
 
The `status` value will be either `success` or `error`, and the `message` value will include a human readable message.   



                
