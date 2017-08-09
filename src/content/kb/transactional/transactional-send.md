
# Sending a transactional email

> POST https://api.expresspigeon.com/messages

JSON object represents a message to be sent.

## Request parameters

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
flow               `No`                   Trigger to start a flow in case of open or click in email.

## Example Request

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
        "dictionaries": ["dict1","dict2"],
        "flow": {
            "id": 321, 
            "trigger": "click"
        }
    }'
'https://api.expresspigeon.com/messages'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.Collections.map;
import static org.javalite.common.Collections.list;
import static org.javalite.common.JsonHelper.toJsonString;
import static org.javalite.common.JsonHelper.toMap;

String content = toJsonString(map("template_id", 123,
        "reply_to", "john@example.net",
        "from", "John",
        "to", "jane@example.net",
        "subject", "Dinner served",
        "merge_fields", map("first_name", "John", "menu", "<table class='report'><tr><td>Burger:</td></tr><tr>$9.99<td></td></tr></table>"),
        "dictionaries", list("dict1", "dict2")
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
  'from' => 'John',
  'to' => 'jane@example.net',
  'subject' => 'Dinner served',
  'merge_fields' => array('first_name' => 'John', 'menu' => '<table class=\'report\'><tr><td>Burger:</td></tr><tr>$9.99<td></td></tr></table>'),
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
require 'expresspigeon-ruby'

response = ExpressPigeon::API.messages.send_message template_id, 'john@example.com', 'jane@example.com', "Jane Doe",  
                                        "Let's go out for dinner?", 
                                        { first_name: 'John', meetup_place: 'Downtown' }
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon

api = ExpressPigeon()
response = api.messages.send_message(template_id=123,
                                      to="jane@example.net",
                                      reply_to="john@example.net", from_name="John", subject="Dinner served",
                                      merge_fields={"first_name": "John", "menu": "<table><tr><td>Burger:</td></tr><tr>$9.99<td></td></tr></table>})
~~~~

</div>

</div>

 The code above also shows that it is possible to inject HTML chunks into specific placeholders inside your email template.

> NOTE: It is important to use only single quotes in injected HTML

## Example Response

~~~~ {.js .numberLines}
{
    "status": "success",
    "code": 200,
    "id": 1234,
    "message": "email queued"
}
~~~~

In the call above, the `id` represents an ID of a message that was sent.
You can use this value in order to get a [report on the status of this message](transactional-reporting-for-single-message).

