
# Sending transactional messages in bulk

Provides ability to send transactional messages in bulk.

> POST https://api.expresspigeon.com/messages/bulk

ZIP file represents multiple JSON objects, one for each transactional message. 

## Sending format

This API end point requires compressing (zipping) multiple requests for [sending a single message](transactional-send) 
into a single ZIP file.
 
When submitting a ZIP file, follow these rules: 

* The ZIP file contains only one text file.   
* Multiple JSON request objects are flattened into single lines of text in the text file. 
* A maximum number of lines (messages) in a single request is 1000.
* Each line has the same exact format and accepts the [same parameters as a single message end point](transactional-send#request-parameters).
  
## Step by step

Here is a steps to create a ZIP file and submit to the end point. Let's say we need to send two messages with one request.

**Step 1:** Create a ZIP file

We can give this file any name: `messages.txt`, and let's place this content there: 

```
{"template_id": 123,"reply_to": "info@example.net","from": "Team Bank","to": "jane@example.net","subject": "Your password reset message"}
{"template_id": 123,"reply_to": "billing@example.net","from": "Billing dept","to": "jane@example.net","subject": "Statement generated"}
```

Each line in this file is an independent JSON document. 

**Step 2:** Create a ZIP file

The name of the ZIP file and the name of the file that is zipped does not mater

 
**Step 3:** Post the ZIP to the end point
 
Upload the ZIP file to  https://api.expresspigeon.com/messages/bulk with a `POST` HTTP method.

## Example Request

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X POST https://api.expresspigeon.com/messages/bulk  \
    -H "Content-type: multipart/form-data" \
    -H "X-auth-key: 00000000-0000-0000-0000-000000000000"\
    -F file=@bulk.zip
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toMap;

String response = Http.multipart("https://api.expresspigeon.com/messages/bulk")
        .header("X-auth-key", AUTH_KEY)
        .file("file", "/path/to/bulk.zip")
        .text();
Map<String, Object> result = toMap(response);
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
$bulk = file_get_contents('/path/to/bulk.zip');

$eol = "\r\n";
$data = '';

$mime_boundary=md5(time());

$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="file"; filename="bulk.zip"' . $eol;
$data .= 'Content-Type: application/zip' . $eol;
$data .= 'Content-Transfer-Encoding: base64' . $eol . $eol;
$data .= $bulk . $eol;
$data .= "--" . $mime_boundary . "--" . $eol . $eol;

$params = array('http' => array(
                  'method' => 'POST',
                  'header' => 'X-auth-key: 00000000-0000-0000-0000-000000000000'  . $eol .
                              'Content-Type: multipart/form-data; boundary=' . $mime_boundary . $eol,
                  'content' => $data
               ));

$ctx = stream_context_create($params);
$response = file_get_contents('https://api.expresspigeon.com/messages/bulk', FILE_TEXT, $ctx);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
not yet supported
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon

api = ExpressPigeon()
response = api.send_message_bulk("bulk.zip")
~~~~

</div>

</div>

**Step 4:** Process response

Please, see below for the [response format](#response-format). When posting the file, the same security rules apply as to any other API end points, 
 see the [Security and authentication](security-and-authentication) page.
 
 

## Limitations

This API end point will process the first 1000 messages per file and will reject a file with more than 1000 lines with status code 400. 

## Attachments

Sending bulk transactional messages with attachments is currently not supported.

## Response format

The response will come out in a form of text (Content-type=text/plain), where each line is a
small JSON document in the same order as the JSON documents in the input file. In other words, the response content will have as many JSON 
documents as there were lines in the input file. 

The sending program needs to process each JSON document separately because each line may have a different format. 

If processing of a specific input JSON document line was successful, the corresponding output JSON document line will conform to 
[example response](transactional-send#example-response). 

If processing of a specific input JSON document was _not_ successful, than the rules of [error codes and responses](error-codes-responses) will apply. 


Here is an example of an output: 


```
{"code":200,"id":"12fff9a9-ad10-4e4d-91a2-e63f10c14af6","message":"email queued","status":"success"}
{"code":200,"id":"e63f1049-sde4-eyd4-sw34-4e4ddsvv91a2","message":"email queued","status":"success"}
{"status":"error","code":404,"message": "template=388 not found"}
{"code":200,"id":"e63f10as-s1e4-3h45-d74j-ddqwe2csdcv4","message":"email queued","status":"success"}

```


> The order of response documents strictly corresponds to input documents, i.e. each output document contain the response to the input document 
located in the submitted file at the same index. 


Like the input lines, the response JSON objects are flattened into individual lines with the header `Content-type` = `text/text`. 