<ul data-toc data-toc-headings="h2,h3,h4"></ul>

# Report for a single message

> GET https://api.expresspigeon.com/messages/{id}

Returns a report with properties of a sent message, such as 'delivered' or 'bounced', 'opened', 'clicked' etc.

## Request parameters

Parameter          Required               Description
-------------      --------------------   --------------------------------
id                 Yes                    Id of sent message

## Example Request

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/messages/1'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toMap;

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
from expresspigeon import ExpressPigeon

api = ExpressPigeon()
response = api.messages.report(1)
~~~~

</div>

</div>

## Example Response

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
