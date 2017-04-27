# Campaigns

Campaign API provides the same service as sending email campaigns from the website. A campaign consists of newsletter template, subject, from name, reply to, and a lists of contacts a campaign can be sent to.

## Campaigns Creation

> POST https://api.expresspigeon.com/campaigns

Creates a campaign. Invocation of this API will trigger sending or scheduling a new campaign. The content type of a request must be *application/json*.

**Request parameters**

Parameter          Required               Description
-------------      --------------------   --------------------------------
list_id            Yes                    The id of a list the campaign is sent to. The list must be enabled.
template_id        Yes                    The id of a newsletter template used for the campaign.
name               Yes                    The name of a campaign. This name is for your reference only and will not be exposed to your audience. If you have Google Analytics turned on, this value will also be used for Google Analytics campaign.
from_name          Yes                    This parameter is displayed as "From" field in the email program when your recipients view your message. Use this value to clearly state your name or name of your organization.
reply_to           Yes                    This parameter specifies the email address which will be getting replies from your recipients should they choose to reply. The **reply_to** should be a valid email address.
subject            Yes                    The subject of a newsletter
google_analytics   Yes                    Indicates whether Google Analytics should be enabled for a campaign. Should be *true* or *false*.
schedule_for       `No`                   Specifies what time a campaign should be sent. If it is provided the campaign will be scheduled to this time, otherwise campaign is sent immediately. The **schedule_for** must be in ISO date format and should be in the future.


**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X POST -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
    -H "Content-type: application/json" \
    -d '{
        "list_id": "1",
        "template_id": "1",
        "name": "My first newsletter",
        "from_name": "Dave",
        "reply_to": "dave@expresspigeon.com",
        "subject": "Hello from Dave",
        "google_analytics": "false",
        "schedule_for": "2013-05-28T14:03:17.956+0300"
    }' \
'https://api.expresspigeon.com/campaigns'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.Collections.map;
import static org.javalite.common.JsonHelper.toJsonString;
import static org.javalite.common.JsonHelper.toMap;

String content = toJsonString(map("list_id", "1",
        "template_id", "1",
        "name", "My first newsletter",
        "from_name", "Dave",
        "reply_to", "dave@expresspigeon.com",
        "subject", "Hello from Dave",
        "google_analytics", "false",
        "schedule_for", "2013-05-28T14:03:17.956+0300"));
String response = Http.post("https://api.expresspigeon.com/campaigns", content)
        .header("X-auth-key", AUTH_KEY)
        .header("Content-type", "application/json")
        .text();
Map<String, Object> result = toMap(response);
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
$data = array(
  'list_id' => '1',
  'template_id' => '1',
  'name' => 'My first newsletter',
  'from_name' => 'Dave',
  'reply_to' => 'dave@expresspigeon.com',
  'subject' => 'Hello from Dave',
  'google_analytics' => 'false',
  'schedule_for' => '2013-05-28T14:03:17.956+0300'
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
$result = file_get_contents('https://api.expresspigeon.com/campaigns', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'expresspigeon-ruby'

resp = ExpressPigeon::API.campaigns.send(:list_id => list_id, :template_id => template_id,
                               :name => 'My Campaign', :from_name => 'John', :reply_to => reply_to,
                               :subject => 'Hello, there!', :google_analytics => false)
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.campaigns.schedule(list_id=1, template_id=1, name="My first newsletter",
                                      from_name="Dave",
                                      reply_to="dave@expresspigeon.com", subject="Hello from Dave",
                                      google_analytics=False,
                                      schedule_for="2013-05-28T14:03:17.956+0300")
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
{
    "status": "success",
    "code": 200,
    "message": "new campaign created successfully",
    "campaign_id": 1
}
~~~~


## Delete a Campaign

> DELETE https://api.expresspigeon.com/campaigns/{id}

Removes a campaign with a given id. Only scheduled campaigns can be deleted. Those that have already been sent cannot be deleted.

**Request parameters**

Parameter          Required               Description
-------------      --------------------   --------------------------------
id                 Yes                    The id of a campaign to be removed.


**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X DELETE -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/campaigns/2'      
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toMap;

String response = Http.delete("https://api.expresspigeon.com/campaigns/2")
        .header("X-auth-key", AUTH_KEY)
        .text();
Map<String, Object> result = toMap(response);
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
$options = array(
  'http' => array(
    'method' => 'DELETE',
    'header' => "X-auth-key: 00000000-0000-0000-0000-000000000000\r\n"
    )
);
$context = stream_context_create($options);
$result = file_get_contents('https://api.expresspigeon.com/campaigns/2', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'expresspigeon-ruby'

resp = ExpressPigeon::API.campaigns.delete campaign_id
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.campaigns.delete(2)
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
{
    "status": "success",
    "code": 200,
    "message": "campaign 1 was deleted"
}
~~~~


## List Campaigns

> GET https://api.expresspigeon.com/campaigns

Returns a list of at most 1000 created campaigns, to get the next batch use from_id parameter.

**Request parameters**

Parameter          Required                Description
-------------      --------------------    --------------------------------
from_id            `No`                    Id from where to get the next batch, e.g. the last id from the previous call
from               `No`                    Start of the sending period (UTC, example: 2013-03-16T10:00:00.000+0000)
to                 `No`                    End of the sending period (UTC, example: 2013-03-16T20:00:00.000+0000)

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X GET -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/campaigns'   
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toList;

String response = Http.get("https://api.expresspigeon.com/campaigns")
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
$result = file_get_contents('https://api.expresspigeon.com/campaigns', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'expresspigeon-ruby'

campaigns = ExpressPigeon::API.campaigns.all
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.campaigns.get_all()
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
{
    "total": 1123,
    "id": 456,
    "send_time": "2013-09-20T11:29:57.000+0000",
    "template_name": "Bob's standard newsletter",
    "template_id": 123,
    "reply_to": "bob@example.net",
    "from_name": "Bobby",
    "subject": "Bob's newsletter #34",
    "name": "Bob's campaign #34",
    "list_id": 123
}
~~~~


## Report for a Single Campaign

> GET https://api.expresspigeon.com/campaigns/{campaign_id}

Returns a report for a campaign by campaign id.

**Request parameters**

Parameter          Required               Description
-------------      --------------------   ----------------------------------------
campaign_id        Yes                    Campaign id the report is generated for.


**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/campaigns/1'  
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toMap;

String response = Http.get("https://api.expresspigeon.com/campaigns/1")
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
$result = file_get_contents('https://api.expresspigeon.com/campaigns/1', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'expresspigeon-ruby'

report = ExpressPigeon::API.campaigns.report campaign_id
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.campaigns.report(1)
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
{
    "unsubscribed": 0,
    "delivered": 3,
    "in_transit": 0,
    "bounced": 0,
    "spam": 0,
    "clicked": 2,
    "opened": 3
}
~~~~


## Get Opened Events for a Campaign

> GET https://api.expresspigeon.com/campaigns/{campaign_id}/opened

Returns an array of opened events from a campaign.

**Request parameters**

Parameter          Required               Description
-------------      --------------------   ----------------------------------------
campaign_id        Yes                    Campaign id the opened events are found for.

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/campaigns/1/opened'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toList;

String response = Http.get("https://api.expresspigeon.com/campaigns/1/opened")
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
$result = file_get_contents('https://api.expresspigeon.com/campaigns/1/opened', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'expresspigeon-ruby'

report = ExpressPigeon::API.campaigns.opened campaign_id
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.campaigns.opened(2)
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
[{
    "timestamp": "2013-09-20T11:29:57.000+0000",
    "ip_address": "127.0.0.1",
    "email": "bob@example.net",
    "event_type": "opened",
    "user_agent": "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)"
},
{
    "timestamp": "2014-01-15T13:34:27.000+0000",
    "ip_address": "127.0.0.1",
    "email": "tob@example.net",
    "event_type": "opened",
    "user_agent": "Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36",
}]
~~~~


## Get Clicked Events for Campaign

> GET https://api.expresspigeon.com/campaigns/{campaign_id}/clicked

Returns an array of clicked events from a campaign.

**Request parameters**

Parameter          Required               Description
-------------      --------------------   ----------------------------------------
campaign_id        Yes                    Campaign id the clicked events are found for.

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/campaigns/1/clicked'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toList;

String response = Http.get("https://api.expresspigeon.com/campaigns/1/clicked")
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
$result = file_get_contents('https://api.expresspigeon.com/campaigns/1/clicked', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'expresspigeon-ruby'

clicked = ExpressPigeon::API.campaigns.clicked campaign_id
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.campaigns.clicked(2)
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
[{
    "timestamp": "2014-01-15T13:34:27.000+0000",
    "ip_address": "127.0.0.1",
    "email": "bob@example.net",
    "event_type": "clicked",
    "user_agent": "Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36",
    "url":"http://example.net"
},
{
    "timestamp": "2014-01-15T13:34:32.000+0000",
    "ip_address":"127.0.0.1",
    "email":"tob@example.net",
    "event_type":"clicked",
    "user_agent":"Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1650.63 Safari/537.36",
    "url":"http://example.net/home"
}]
~~~~


## Get Bounced Contacts for Campaign

> GET https://api.expresspigeon.com/campaigns/{campaign_id}/bounced

Returns an array of object(s) with email and id of bounced contacts from a campaign.

**Request parameters**

Parameter          Required               Description
-------------      --------------------   ----------------------------------------
campaign_id        Yes                    Campaign id the bounced contacts are found for.

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/campaigns/1/bounced'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toList;

String response = Http.get("https://api.expresspigeon.com/campaigns/1/bounced")
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
$result = file_get_contents('https://api.expresspigeon.com/campaigns/1/bounced', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'expresspigeon-ruby'

bounced = ExpressPigeon::API.campaigns.bounced campaign_id
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.campaigns.bounced(1)
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
[{
    "id": "1",
    "email": "bob@example.net",
},
{
    "id": "2",
    "email": "tob@example.net",
}]
~~~~


## Get Unsubscribed Contacts

> GET https://api.expresspigeon.com/campaigns/{campaign_id}/unsubscribed

Returns an array of object(s) with email and id of unsubscribed contacts from a campaign.

**Request parameters**

Parameter          Required               Description
-------------      --------------------   ----------------------------------------
campaign_id        Yes                    Campaign id the unsubscribed contacts are found for.

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/campaigns/1/unsubscribed'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toList;

String response = Http.get("https://api.expresspigeon.com/campaigns/1/unsubscribed")
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
$result = file_get_contents('https://api.expresspigeon.com/campaigns/1/unsubscribed', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'expresspigeon-ruby'

unsubscribed = ExpressPigeon::API.campaigns.unsubscribed campaign_id
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.campaigns.unsubscribed(1)
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
[{
    "id": "1",
    "email": "bob@example.net",
},
{
    "id": "2",
    "email": "tob@example.net",
}]
~~~~


## Get Spam Contacts for Campaign

> GET https://api.expresspigeon.com/campaigns/{campaign_id}/spam

Returns an array of object(s) with email and id of spam contacts from a campaign.

**Request parameters**

Parameter          Required               Description
-------------      --------------------   ----------------------------------------
campaign_id        Yes                    Campaign id the spam contacts are found for.

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/campaigns/1/spam'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toList;

String response = Http.get("https://api.expresspigeon.com/campaigns/1/spam")
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
$result = file_get_contents('https://api.expresspigeon.com/campaigns/1/spam', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">


~~~~ {.ruby .numberLines}
require 'expresspigeon-ruby'

spam = ExpressPigeon::API.campaigns.spam campaign_id
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.campaigns.spam(1)
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
[{
    "id": "1",
    "email": "bob@example.net",
},
{
    "id": "2",
    "email": "tob@example.net",
}]
~~~~
