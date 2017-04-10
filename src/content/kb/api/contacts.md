# Contacts

Contacts end point allows you to create, read, update and delete contacts on your lists. A contact consists of required email and various standard and custom fields.

## Read a single contact by email

> GET https://api.expresspigeon.com/contacts

Returns a single contact by email address.

**Request parameters**

Parameter          Required               Description
-------------      --------------------   --------------------------------
email              Yes                    Email of contact to be selected.


**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/contacts?email=bob@example.net'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toMap;

String response = Http.get("https://api.expresspigeon.com/contacts?email=bob@example.net")
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
$result = file_get_contents('https://api.expresspigeon.com/contacts?email=bob@example.net', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'expresspigeon-ruby'

response = ExpressPigeon::API.contacts.find_by_email 'john@example.com'
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.contacts.find_by_email("bob@example.net")
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
{
    "custom_fields": {
        "my custom field": "custom value"
    },
    "first_name": "Bob",
    "email": "bob@example.net",
    "created_at": "2012-10-29T14:17:58.000+0000",
    "updated_at": "2013-01-24T08:20:52.000+0000",
    "status": "ENGAGED",
    "lists": [{"id": 1}, {"id": 2}}]
}         
~~~~


## Create or update contacts

> POST https://api.expresspigeon.com/contacts

JSON document represents a list of contacts to be created or updated. The `email` field is required. When updating a contact, `list_id` is optional, since the contact is uniquely identified by email across all lists.

**Request parameters**

Parameter          Required               Description
-------------      --------------------   --------------------------------
contacts           Yes                    JSON list represents contacts to be inserted or updated. The email field is required.
list_id            `No`                   List id to add contacts to.


**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X POST -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
    -H "Content-type: application/json" \
    -d '{
        "list_id": 11,
        "contacts": [{
            "email": "john@doe.net",
            "first_name": "John",
            "last_name": "Doe"
        },
        {
            "email": "jane@doe.net",
            "first_name": "Jane",
            "last_name": "Doe",
            "custom_fields": { "relative": "john@doe.net" }
        }]
    }' \
'https://api.expresspigeon.com/contacts'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.Collections.map;
import static org.javalite.common.Collections.list;
import static org.javalite.common.JsonHelper.toJsonString;
import static org.javalite.common.JsonHelper.toMap;

String content = toJsonString(
        map("list_id", 11,
            "contacts", list(
                map("email", "john@doe.net", 
                    "first_name", "John", 
                    "last_name", "Doe"),
                map("email", "jane@doe.net", 
                    "first_name", "Jane", 
                    "last_name", "Doe", 
                    "custom_fields", map("relative", "john@doe.net"))
        )));
String response = Http.post("https://api.expresspigeon.com/contacts", content)
        .header("X-auth-key", AUTH_KEY)
        .header("Content-type", "application/json")
        .text();
Map<String, Object> result = toMap(response);
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
$data = array(
  'list_id' => '11',
  'contacts' => array(array('email' => 'john@doe.net', 'first_name' => 'John', 'last_name' => 'Doe'),
                      array('email' => 'jane@doe.net', 'first_name' => 'Jane', 'last_name' => 'Doe', 'custom_fields' => array('relative' => 'john@doe.net'))
));
$options = array(
  'http' => array(
    'method' => 'POST',
    'content' => json_encode($data),
    'header' => "Content-Type: application/json\r\n" .
                "X-auth-key: 00000000-0000-0000-0000-000000000000\r\n"
    )
);
$context = stream_context_create($options);
$result = file_get_contents('https://api.expresspigeon.com/contacts', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'expresspigeon-ruby'

resp = ExpressPigeon::API.contacts.upsert list_id, 
            email: "john@example.com", :first_name => 'John', :last_name => 'Doe',
            :custom_fields => {:eye_color => "blue", }
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.contacts.upsert(11, [{"email": "john@doe.net", "first_name": "John", "last_name": "Doe"},
                                    {"email": "jane@doe.net", "first_name": "Jane", "last_name": "Doe", "custom_fields": {"relative": "john@doe.net"}}])
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
{
    "status" : "success",
    "code" : 200,
    "message" : "contacts created/updated successfully",
    "contacts": [ "bob@example.net" ]
}         
~~~~

List of created/updated contact emails is returned for your convenience. If there is an issue with a contact (contact is suppressed, bad formatting. etc.), no changes are made to entire set of contacts and the call returns a parameter `failed_contact_num` which indicates the position of problem contact in the submitted document.


## Delete a single contact

> DELETE https://api.expresspigeon.com/contacts

> NOTE: this call requires the HTTP DELETE method

**Request parameters**

Parameter          Required               Description
-------------      --------------------   --------------------------------
email              Yes                    Contact email to be deleted
list_id            `No`                   List id to remove contact from, if not provided, contact will be deleted from system


**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X DELETE -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/contacts?email=bob@example.net'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toMap;

String response = Http.delete("https://api.expresspigeon.com/contacts?email=bob@example.net")
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
$result = file_get_contents('https://api.expresspigeon.com/contacts?email=bob@example.net', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'expresspigeon-ruby'

response = ExpressPigeon::API.contacts.delete 'mary@example.com', list_id
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.contacts.delete("bob@example.net")
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
{
    "status" : "success",
    "code" : 200,
    "message" : "contact=bob@example.net deleted successfully"
}         
~~~~


## Move contacts between lists

> POST https://api.expresspigeon.com/contacts/move

JSON document represents a list of contacts to be moved between source and target lists. All fields are required.

**Request parameters**

Parameter          Required               Description
-------------      --------------------   --------------------------------
source_list        Yes                    Source list id
target_list        Yes                    Target list id
contacts           Yes                    Contacts to be moved


**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X POST -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
    -H "Content-type: application/json" \
    -d '{
        "source_list": 1,
        "target_list": 2,
        "contacts": [ "bob@example.net", "toby@example.net" ]
    }' \
'https://api.expresspigeon.com/contacts/move'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.Collections.map;
import static org.javalite.common.Collections.list;
import static org.javalite.common.JsonHelper.toJsonString;
import static org.javalite.common.JsonHelper.toMap;

String content = toJsonString(map("source_list", 1,
        "target_list", 2,
        "contacts", list("bob@example.net", "toby@example.net")));
String response = Http.post("https://api.expresspigeon.com/contacts/move", content)
        .header("X-auth-key", AUTH_KEY)
        .header("Content-type", "application/json")
        .text();
Map<String, Object> result = toMap(response);
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
$data = array(
  'source_list' => 1,
  'target_list' => 2,
  'contacts' => array('bob@example.net', 'toby@example.net')
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
$result = file_get_contents('https://api.expresspigeon.com/contacts/move', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
Ruby example coming soon
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.contacts.move(1, 2, ["bob@example.net", "toby@example.net"])
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
{
    "status" : "success",
    "code" : 200,
    "message" : "contacts moved from list=1 to list=2"
}         
~~~~