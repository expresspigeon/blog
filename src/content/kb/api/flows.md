# Flows

## Start for a Contact

> POST https://api.expresspigeon.com/flows/{flow_id}/start

This call starts a flow for a contact.

**Request Parameters**

Parameter            Required               Description
-------------        --------------------   --------------------------------
flow_id              Yes                    Flow id to be started for a contact
email                Yes                    Contact email

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X POST -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
    -H "Content-type: application/json" \
    -d '{"email": "bob@example.net"}' \
'https://api.expresspigeon.com/flows/1/start'      
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.Collections.map;
import static org.javalite.common.JsonHelper.toJsonString;
import static org.javalite.common.JsonHelper.toMap;

String content = toJsonString(map("email", "bob@example.net"));
String response = Http.post("https://api.expresspigeon.com/flows/1/start", content)
        .header("X-auth-key", AUTH_KEY)
        .header("Content-type", "application/json")
        .text();
Map<String, Object> result = toMap(response);
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
$data = array(
  'email' => 'bob@example.net'
);
$options = array(
  'http' => array(
    'method' => 'POST',
    'content' => json_encode($data),
    'header' => "Content-Type: application/json\r\n" .
                "X-auth-key: 00000000-0000-0000-0000-000000000000\r\n"
    )
);
$context  = stream_context_create($options);
$result = file_get_contents('https://api.expresspigeon.com/flows/1/start', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
not yet supported
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
not yet supported
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
{
    "status": "success",
    "code": 200,
    "message": "automation=1 started successfully for contact=bob@example.net"
}          
~~~~