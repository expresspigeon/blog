# Autoresponders

<ul data-toc data-toc-headings="h2,h3,h4"></ul>

## Get all autoresponders

> GET https://api.expresspigeon.com/auto_responders

Returns an array of autoresponders.

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/auto_responders'      
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toList;

String response = Http.get("https://api.expresspigeon.com/auto_responders")
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
$result = file_get_contents('https://api.expresspigeon.com/auto_responders', false, $context);
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
auto_responders = api.auto_responders.find_all()
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
[{
    "auto_responder_parts": [{
        "auto_responder_part_id": 1,
        "subject": "My autoresponder",
        "template_id": 1
    }],
    "name": "My autoresponder",
    "auto_responder_id": 1
}]            
~~~~


## Start for a contact

> POST https://api.expresspigeon.com/auto_responders/{auto_responder_id}/start

This call starts an autoresponder for a contact.

**Request parameters**

Parameter            Required               Description
-------------        --------------------   --------------------------------
auto_responder_id    Yes                    Autoresponder id to be started for a contact
email                Yes                    Contact email

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X POST -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
    -H "Content-type: application/json" \
    -d '{"email": "bob@example.net"}' \
'https://api.expresspigeon.com/auto_responders/1/start'      
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.Collections.map;
import static org.javalite.common.JsonHelper.toJsonString;
import static org.javalite.common.JsonHelper.toMap;

String content = toJsonString(map("email", "bob@example.net"));
String response = Http.post("https://api.expresspigeon.com/auto_responders/1/start", content)
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
$result = file_get_contents('https://api.expresspigeon.com/auto_responders/1/start', false, $context);
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
response = api.auto_responders.start(1, "bob@example.net")
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
{
    "status": "success",
    "code": 200,
    "message": "auto_responder=1 started successfully for contact=bob@example.net"
}          
~~~~


## Stop for a contact

> POST https://api.expresspigeon.com/auto_responders/{auto_responder_id}/stop

This call stops an autoresponder for a contact.

**Request parameters**

Parameter            Required               Description
-------------        --------------------   --------------------------------
auto_responder_id    Yes                    Autoresponder id to be stopped for a contact
email                Yes                    Contact email

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X POST -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
    -H "Content-type: application/json" \
    -d '{"email": "bob@example.net"}' \
'https://api.expresspigeon.com/auto_responders/1/stop'     
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.Collections.map;
import static org.javalite.common.JsonHelper.toJsonString;
import static org.javalite.common.JsonHelper.toMap;

String content = toJsonString(map("email", "bob@example.net"));
String response = Http.post("https://api.expresspigeon.com/auto_responders/1/stop", content)
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
$context = stream_context_create($options);
$result = file_get_contents('https://api.expresspigeon.com/auto_responders/1/stop', false, $context);
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
response = api.auto_responders.stop(1, "bob@example.net")
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
{
    "status": "success",
    "code": 200,
    "message": "auto_responder=1 stopped successfully for contact=bob@example.net"
}          
~~~~


## Report for a single autoresponder

> GET https://api.expresspigeon.com/auto_responders/{auto_responder_id}

Returns a report for a single autoresponder by id.

**Request parameters**

Parameter            Required               Description
-------------        --------------------   --------------------------------
auto_responder_id    Yes                    Autoresponder id for which this report is generated

**Example Request**

<div class="tab-content">
 
<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/auto_responders/1'    
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toList;

String response = Http.get("https://api.expresspigeon.com/auto_responders/1")
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
$result = file_get_contents('https://api.expresspigeon.com/auto_responders/1', false, $context);
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
response = api.auto_responders.report(1)
~~~~

</div>

</div>

**Example Response**
 
~~~~ {.js .numberLines}
[{
    "auto_responder_part_id": 9,
    "delivered": 1,
    "unsubscribed": 0,
    "in_transit": 0,
    "bounced": 0,
    "spam": 0,
    "clicked": 0,
    "opened": 1
}]        
~~~~


## Get bounced contacts for autoresponder part

> GET https://api.expresspigeon.com/auto_responders/ {auto_responder_id}/{auto_responder_part_id}/bounced

Returns an array of object(s) with email and id of bounced contacts associated with this autoresponder part.

**Request parameters**

Parameter                Required               Description
-------------            --------------------   --------------------------------
auto_responder_id        Yes                    Autoresponder id the bounced contacts are found for
auto_responder_part_id   Yes                    Autoresponder part id the bounced contacts are found for

**Example Request**

<div class="tab-content">
 
<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/auto_responders/1/2/bounced'    
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toList;

String response = Http.get("https://api.expresspigeon.com/auto_responders/1/2/bounced")
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
$result = file_get_contents('https://api.expresspigeon.com/auto_responders/1/2/bounced', false, $context);
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
response = api.auto_responders.bounced(1, 2)
~~~~

</div>

</div>

**Example Response**
 
~~~~ {.js .numberLines}
[{"id": 1, "email": "bob@example.net"}, {"id": 2, "email": "tob@example.net"}]        
~~~~


## Get unsubscribed contacts for autoresponder part

> GET https://api.expresspigeon.com/auto_responders/ {auto_responder_id}/{auto_responder_part_id}/unsubscribed

Returns an array of object(s) with email and id of unsubscribed contacts associate with this autoresponder part.

**Request parameters**

Parameter                Required               Description
-------------            --------------------   --------------------------------
auto_responder_id        Yes                    Autoresponder id the unsubscribed contacts are found for
auto_responder_part_id   Yes                    Autoresponder part id the unsubscribed contacts are found for

**Example Request**

<div class="tab-content">
 
<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/auto_responders/1/2/unsubscribed'       
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toList;

String response = Http.get("https://api.expresspigeon.com/auto_responders/1/2/unsubscribed")
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
$result = file_get_contents('https://api.expresspigeon.com/auto_responders/1/2/unsubscribed', false, $context);
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
response = api.auto_responders.unsubscribed(1, 2)
~~~~

</div>

</div>

**Example Response**
 
~~~~ {.js .numberLines}
[{"id": 1, "email": "bob@example.net"}, {"id": 2, "email": "tob@example.net"}]       
~~~~


## Get spam contacts for autoresponder part

> GET https://api.expresspigeon.com/auto_responders/ {auto_responder_id}/{auto_responder_part_id}/spam

Returns an array of object(s) with email and id of spam contacts associated with this autoresponder part.

**Request parameters**

Parameter                Required               Description
-------------            --------------------   --------------------------------
auto_responder_id        Yes                    Autoresponder id the spam contacts are found for
auto_responder_part_id   Yes                    Autoresponder part id the spam contacts are found for

**Example Request**

<div class="tab-content">
 
<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/auto_responders/1/2/spam'      
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toList;

String response = Http.get("https://api.expresspigeon.com/auto_responders/1/2/spam")
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
$result = file_get_contents('https://api.expresspigeon.com/auto_responders/1/2/spam', false, $context);
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
response = api.auto_responders.spam(1, 2)
~~~~

</div>

</div>

**Example Response**
 
~~~~ {.js .numberLines}
[{"id": 1, "email": "bob@example.net"}, {"id": 2, "email": "tob@example.net"}]     
~~~~
