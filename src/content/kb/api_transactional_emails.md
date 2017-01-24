# Transactional emails made easy!

<ul data-toc data-toc-headings="h2,h3,h4"></ul>

Contacts end point allows you to create, read, update and delete contacts on your lists. A contact consists of required email and various standard and custom fields.

**Design**

~~~~ {.designcode .numberLines}
YOURCOMPANYLOGO
Hi, ${first_name}!
Your statement is ready to review online!
~~~~

**Post**

~~~~ {.js .numberLines}
{
    "template_id": 123,
    "reply_to": "john@acme.com",
    "from": "John Doe",
    "to": "jane@doe.com",
    "subject": "Statement ready",
    "merge_fields": {
      "first_name": "Jane"
    }
}       
~~~~

**Result**

~~~~ {.designcode .numberLines}
YOURCOMPANYLOGO
Hi, Jane!
Your statement is ready to review online!
~~~~

Transactional emails are sometimes called triggered emails. Unlike bulk emails, they are sent one at the time on per need basis and contain highly personalized content. Examples of triggered emails can be one-off messages, such as password reset, statement generated, etc.

Our Transactional API is a set of HTTP REST end points designed for implementation with external systems in order to send email as well as retrieving reporting data.

**Messages**

Sending Transactional emails requires that newsletter templates for these emails are created prior to sending. Such template can have merge fields, in a format `${field_name}`. This feature allows a high degree of flexibility for message customization.

The newsletter to be sent can have a number of merge fields, with data for merging dynamically provided during a call.


## Send a single transactional email

> POST https://api.expresspigeon.com/messages

JSON object represents a message to be sent.

**Request parameters**

Parameter          Required               Description
-------------      --------------------   --------------------------------
template_id        Yes                    Newsletter template id to be sent
to                 Yes                    Email address to send message to
reply_to           Yes                    Email address tp reply to
from               Yes                    From name, such as your name or name of your organization
subject            Yes                    Email message subject
merge_fields       `No`                   Values for merge fields
view_online        `No`                   Generates online version of sent message. We will host this generated message on our servers, default is `false`
click_tracking     `No`                   Overwrites all URLs in email to point to `http://clicks.expresspigeon.com` for click tracking. Setting it to `false` will preserve all URLs intact, but click tracking will not be available, default is `true`
suppress_address   `No`                   If `true` suppresses insertion of sender's physical address in the email, default is `false`
dictionaries       `No`                   List of dictionaries to source merge fields from. Dictionary values override all other values (from merge_fields) in case of name collisions. See [Dictionaries](/kb/api_dictionaries) section for more information.

**Curl example**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X POST -H "X-auth-key: 00000000-0000-0000-0000-000000000000"
    -H "Content-type: application/json"
    -d \
    '{
        "template_id": 123,
        "reply_to": "john@example.net",
        "from": "John",
        "to": "jane@example.net",
        "subject": "Dinner served",
        "merge_fields": {
            "first_name": "John",
            "menu": "<table><tr><td>Burger:</td></tr><tr>$9.99<td></td></tr></table>"
            },
        "dictionaries": ["dict1","dict2"]
    }'
'https://api.expresspigeon.com/messages'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
String content = toJsonString(map("template_id", 123,
        "reply_to", "john@example.net",
        "from", "John",
        "to", "jane@example.net",
        "subject", "Dinner served",
        "merge_fields", map("first_name", "John", "menu": "&lt;table&gt;&lt;tr&gt;&lt;td&gt;Burger:&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;$9.99&lt;td&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;"),
        "dictionaries": list("dict1", "dict2")
));
String response = Http.post("https://api.expresspigeon.com/messages", content)
        .header("X-auth-key", AUTH_KEY)
        .header("Content-type", "application/json")
        .text();
Map<String, Object> result = toMap(response);
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
$data = array(
  'template_id' => 123,
  'reply_to' => 'john@example.net',
  'to' => 'jane@example.net',
  'subject' => 'Dinner served',
  'merge_fields' => array('first_name' => 'John', 'menu' => '&lt;table&gt;&lt;tr&gt;&lt;td&gt;Burger:&lt;/td&gt;&lt;/tr&gt;&lt;tr&gt;$9.99&lt;td&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;'),
  'dictionaries' => array('dict1', 'dict2')
);
$options = array(
  'http' => array(
    'method' => 'POST',
    'content' => json_encode($data),
    'header' => "Content-Type: application/json\r\n" .
                "X-auth-key: 00000000-0000-0000-0000-000000000000\r\n"
    )
);
$context = stream_context_create($options);
$result = file_get_contents('https://api.expresspigeon.com/messages', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
here ruby code
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
here python code
~~~~

</div>

</div>

Code above also shows that it is possible to inject HTML chunks into specific placeholders inside your email template.

> NOTE: It is important to use only single quotes in injected HTML

**Example Response**

~~~~ {.js .numberLines}
{
    "status": "success",
    "code": 200,
    "id": 1,
    "message": "email queued"
}          
~~~~

In a call above, the `id` represents an ID of a message that was sent. You can use this value in order to get a report on status of this message. Please, see below on how to retrieve such a report.


## Send a message with attachment

> POST https://api.expresspigeon.com/messages

**Request parameters**

Request parameters are the same as when sending a [single message](#send-a-single-transactional-email) without attachments.

> Limitations are: maximum three attachments, each under 10kb in size.

**Curl example**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X POST https://api.expresspigeon.com/messages  \
    -H "Content-type: multipart/form-data" \
    -H "X-auth-key: 00000000-0000-0000-0000-000000000000"\
    -F template_id=123\
    -F reply_to='john@doe.com'\
    -F from='John Doe'\
    -F to='jane@doe.com'\
    -F subject='two attachments'\
    -F view_online=true\
    -F suppress_address=true\
    -F click_tracking=false\
    -F merge_fields='{"first_name": "Jane"}'\
    -F attachment=@attachment1.txt\
    -F attachment=@attachment2.txt
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
String response = Http.multipart("https://api.expresspigeon.com/messages")
        .header("X-auth-key", AUTH_KEY)
        .file("attachment", "/path/to/attachment1.txt")
        .file("attachment", "/path/to/attachment2.txt")
        .field("template_id", "123")
        .field("reply_to", "john@doe.com")
        .field("from", "John Doe")
        .field("to", "jane@doe.com")
        .field("subject", "two attachments")
        .field("view_online", "true")
        .field("suppress_address", "true")
        .field("click_tracking", "false")
        .field("merge_fields", toJsonString(map("first_name", "Jane")))
        .text();
Map<String, Object> result = toMap(response);
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
$eol = "\r\n";
$data = '';
 
$mime_boundary=md5(time());
 
$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="template_id"' . $eol . $eol;
$data .= "123" . $eol;
$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="reply_to"' . $eol . $eol;
$data .= "john@doe.com" . $eol;
$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="from"' . $eol . $eol;
$data .= "John Doe" . $eol;
$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="to"' . $eol . $eol;
$data .= "jane@doe.com" . $eol;
$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="subject"' . $eol . $eol;
$data .= "two attachments" . $eol;
$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="view_online"' . $eol . $eol;
$data .= "true" . $eol;
$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="suppress_address"' . $eol . $eol;
$data .= "true" . $eol;
$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="click_tracking"' . $eol . $eol;
$data .= "false" . $eol;
$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="merge_fields"' . $eol . $eol;
$data .= json_encode(array('first_name' => 'Jane')) . $eol;
$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="attachment"; filename="attachment1.txt"' . $eol;
$data .= 'Content-Type: text/plain' . $eol;
$data .= 'Content-Transfer-Encoding: base64' . $eol . $eol;
$data .= chunk_split(base64_encode("attachment1.txt content")) . $eol;
$data .= "--" . $mime_boundary . "--" . $eol . $eol;
$data .= 'Content-Disposition: form-data; name="attachment"; filename="attachment2.txt"' . $eol;
$data .= 'Content-Type: text/plain' . $eol;
$data .= 'Content-Transfer-Encoding: base64' . $eol . $eol;
$data .= chunk_split(base64_encode("attachment2.txt content")) . $eol;
$data .= "--" . $mime_boundary . "--" . $eol . $eol;
 
$params = array('http' => array(
                  'method' => 'POST',
                  'header' => 'Content-Type: multipart/form-data; boundary=' . $mime_boundary . $eol,
                  'content' => $data
               ));
 
$ctx = stream_context_create($params);
$response = @file_get_contents('https://api.expresspigeon.com/messages', FILE_TEXT, $ctx);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
here ruby code
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
here python code
~~~~

</div>

</div>

Code above shows how to include attachments. The paths to files can be absolute, or relative (as in this example).

**Example Response**

~~~~ {.js .numberLines}
{
    "status": "success",
    "code": 200,
    "id": 1,
    "message": "email queued"
}          
~~~~

In a call above, the `id` represents an ID of a message that was sent. You can use this value in order to get a report on status of this message. Please, see below on how to retrieve such a report.


## Report for a single message

> GET https://api.expresspigeon.com/messages/{id}

Returns a report with properties of a sent message, such as 'delivered' or 'bounced', 'opened', 'clicked' etc.

**Request parameters**

Parameter          Required               Description
-------------      --------------------   --------------------------------
id                 Yes                    Id of sent message

**Curl example**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}        
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/messages/1'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
String response = Http.get("https://api.expresspigeon.com/messages/1")
        .header("X-auth-key", AUTH_KEY)
        .text();
Map<String, Object> result = toMap(response);
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
$options = array(
  'http' => array(
    'method' => 'GET',
    'header' => "X-auth-key: 00000000-0000-0000-0000-000000000000\r\n"
    )
);
$context = stream_context_create($options);
$result = file_get_contents('https://api.expresspigeon.com/messages/1', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
here ruby code
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
here python code
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
{
    "id": 1,
    "email": "john@example.net",
    "in_transit": false,
    "delivered": true,
    "bounced": false,
    "opened": true,
    "clicked": true,
    "urls": [
        "http://example.net/buy_a_burger"
    ],
    "spam": false,
    "created_at": "2013-03-15T11:20:21.770+0000",
    "updated_at": "2013-03-16T11:22:23.210+0000"
}          
~~~~


## Report for multiple messages

> GET https://api.expresspigeon.com/messages/{period}

Returns a report (ordered by id) for at most 1000 of transactional emails sent with this API, to get the next batch use `from_id` parameter.

**Request parameters**

Parameter          Required                Description
-------------      --------------------    --------------------------------
start_date         `No`                    Start of the reporting period (UTC, example: 2013-03-16T10:00:00.000+0000)
end_date           `No`                    End of the reporting period (UTC, example: 2013-03-16T20:00:00.000+0000)
period             `No`                    Predefined reporting period: `last24hours`, `last_week`, `last_month`
from_id            `No`                    Id from where to get the next batch, e.g. the last id from the report

**Curl example**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}        
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/messages'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
String response = Http.get("https://api.expresspigeon.com/messages")
        .header("X-auth-key", AUTH_KEY)
        .text();
List result = toList(response);
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
$options = array(
  'http' => array(
    'method' => 'GET',
    'header' => "X-auth-key: 00000000-0000-0000-0000-000000000000\r\n"
    )
);
$context = stream_context_create($options);
$result = file_get_contents('https://api.expresspigeon.com/messages', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
here ruby code
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
here python code
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
[{
    "id": 1,
    "email": "john@example.net",
    "in_transit": false,
    "delivered": true,
    "bounced": false,
    "opened": true,
    "clicked": true,
    "urls": [
        "http://example.net/buy_a_burger"
    ],
    "spam": false,
    "created_at": "2013-03-15T11:20:21.770+0000",
    "updated_at": "2013-03-16T11:22:23.210+0000"
},
{
    "id": 2,
    "email": "bob@example.net",
    "in_transit": false,
    "delivered": true,
    "bounced": false,
    "opened": false,
    "clicked": false,
    "urls": [],
    "spam": false,
    "created_at": "2013-04-15T11:20:21.770+0000",
    "updated_at": "2013-04-16T11:22:23.210+0000"
}]         
~~~~
