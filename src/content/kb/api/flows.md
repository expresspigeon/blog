# Flows

## Get All Flows

> GET https://api.expresspigeon.com/flows

Returns an array of flows.

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/flows'      
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toList;

String response = Http.get("https://api.expresspigeon.com/flows")
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
$result = file_get_contents('https://api.expresspigeon.com/flows', false, $context);
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
[{
    "live": true,
    "created_at": "2013-09-20T11:29:59.000+0000",
    "name": "My flow",
    "id": 1
}]            
~~~~



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
    "message": "flow=1 started successfully for contact=bob@example.net"
}          
~~~~

## Stop the flow

> POST https://api.expresspigeon.com/flows/{flow_id}/stop

This call stops a flow and switches it to edit mode. No more automations could be run afterwards.

**Request Parameters**

Parameter            Required               Description
-------------        --------------------   --------------------------------
flow_id              Yes                    Flow id to be stopped

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X POST -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/flows/1/stop'     
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.Collections.map;
import static org.javalite.common.JsonHelper.toJsonString;
import static org.javalite.common.JsonHelper.toMap;

String response = Http.post("https://api.expresspigeon.com/flows/1/stop")
        .header("X-auth-key", AUTH_KEY)
        .header("Content-type", "application/json")
        .text();
Map<String, Object> result = toMap(response);
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
$options = array(
  'http' => array(
    'method' => 'POST',
    'header' => "Content-Type: application/json\r\n" .
                "X-auth-key: 00000000-0000-0000-0000-000000000000\r\n"
    )
);
$context = stream_context_create($options);
$result = file_get_contents('https://api.expresspigeon.com/flows/1/stop', false, $context);
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
    "message": "flow=1 stopped and is in edit mode now"
}          
~~~~

## Get flow report

> GET https://api.expresspigeon.com/flows/{flow_id}/report

Get report about all actions executed for this flow.

**Request Parameters**

Parameter            Required               Description
-------------        --------------------   --------------------------------
flow_id              Yes                    Flow id for report

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/flows/1/report'     
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.Collections.map;
import static org.javalite.common.JsonHelper.toJsonString;
import static org.javalite.common.JsonHelper.toMap;

String response = Http.get("https://api.expresspigeon.com/flows/1/report")
        .header("X-auth-key", AUTH_KEY)
        .header("Content-type", "application/json")
        .text();
Map<String, Object> result = toMap(response);
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
$options = array(
  'http' => array(
    'method' => 'GET',
    'header' => "Content-Type: application/json\r\n" .
                "X-auth-key: 00000000-0000-0000-0000-000000000000\r\n"
    )
);
$context = stream_context_create($options);
$result = file_get_contents('https://api.expresspigeon.com/flows/1/report', false, $context);
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
[
    {
        "id": 123,
        "type": "MOVE",
        "email": "bob@example.net",
        "source": 1,
        "target": 2
    },
    {
        "id": 123,
        "type": "COPY",
        "email": "bob@example.net",
        "target": 1
    },
    {
        "id": 125,
        "type": "TRANSACTIONAL",
        "email": "tony@example.net",
        "transactional_id": "f4b821b8-c026-4201-b3f4-991ccd8f982b"
    }
]
~~~~