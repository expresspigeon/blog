# Lists

Lists are sets of contacts a campaign can be sent to. A list consists of name, from name, reply-to fields and physical address that will be displayed in newsletter. Lists can be created, read, updated, deleted and filled up with contacts.

> NOTE: each list has properties, including physical address. Such address is merged into footers of newsletters when campaigns are sent to a list. It allows to send to different lists of contacts and display different physical addresses at the bottom of newsletters depending which list such email was sent to. This is a useful feature for agencies who manage email marketing campaigns on behalf of their clients.

## Get All Lists

> GET https://api.expresspigeon.com/lists

Returns an array of all lists

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/lists'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toList;

String response = Http.get("https://api.expresspigeon.com/lists")
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
$result = file_get_contents('https://api.expresspigeon.com/lists', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'expresspigeon-ruby'
lists =  ExpressPigeon::API.lists.all
lists.each do |list|
   puts list["name"]
end
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.lists.find_all()
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
[{
    "id":1,
    "from_name":"Dave",
    "reply_to":"dave@example.com",
    "contact_count":12345,
    "zip":"60606",
    "state":"IL",
    "address1":"123 Pine St",
    "address2":"unit 128",
    "city":"Chicago",
    "country":"USA",
    "organization":"Acme Tools",
    "name":"Customers 2013",
    "created_at":"2013-01-21T12:27:36.000+0000"
},
{
    "id":2,
    "from_name":"Dave",
    "reply_to":"dave@example.com",
    "contact_count":2345,
    "zip":"60606",
    "state":"IL",
    "address1":"123 Pine St",
    "address2":"",
    "city":"Chicago",
    "country":"USA",
    "organization":"Acme Tools",
    "name":"Main list",
    "created_at":"2013-01-21T12:27:36.000+0000"
}]         
~~~~


## Create a New List

> POST https://api.expresspigeon.com/lists

Creates a new list from given parameters. The request body must be a JSON object representing a list to be created. Please, do not forget to set content-type to `application/json`

**Request Parameters**

Parameter          Required               Description
-------------      --------------------   --------------------------------
name               Yes                    Name of a newly created list
from_name          Yes                    Default "from" name used when sending campaigns to this list
reply_to           Yes                    Default reply To email address used when sending campaigns to this list


**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X POST -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
    -H "Content-type: application/json"      \
    -d '{ "name": "Active customers",        \
          "from_name": "Bob",                \
          "reply_to": "bob@acmetools.com" }'
    'https://api.expresspigeon.com/lists'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.Collections.map;
import static org.javalite.common.JsonHelper.toJsonString;
import static org.javalite.common.JsonHelper.toMap;

String content = toJsonString(map("name", "Active customers", "from_name", "Bob", "reply_to", "bob@acmetools.com"));
String response = Http.post("https://api.expresspigeon.com/lists", content)
               .header("X-auth-key", AUTH_KEY).header("Content-type", "application/json").text();
Map<String, Object> result = toMap(response);
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
$data = array(
  'name' => 'Active customers',
  'from_name' => 'Bob',
  'reply_to' => 'bob@acmetools.com'
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
$result = file_get_contents('https://api.expresspigeon.com/lists', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'expresspigeon-ruby'
list =  ExpressPigeon::API.lists.create 'Active customers', 'Bob', 'bob@acmetools.com'
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.lists.create(name="Active customers", from_name="Bob", reply_to="bob@acmetools.com")
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
{
    "status": "success",
    "code": 200,
    "message": "list=2 created/updated successfully",
    "list": {
        "id": 2,
        "name": "Active customers",
        "from_name": "Bob",
        "reply_to": "bob@acmetools.com",
        "contact_count": 0,
        "zip": "60089",
        "state": "IL",
        "address1": "123 Pine St.",
        "address2": "Unit 128",
        "city": "Chicago",
        "country": "USA",
        "organization": "Acme Tools",
        "created_at": "2013-01-21T12:27:36.000+0000"
    }        
}        
~~~~

> NOTE: The physical address defaulted to the physical address from the account.


## Update Existing List

> PUT https://api.expresspigeon.com/lists

JSON object represents a list to be updated. The **id** field is required. This object can partially represent your list. Whatever fields you provide in the incoming document, will be updated. Omitted fields will stay unchanged.

**Request parameters**

Parameter          Required               Description
-------------      --------------------   --------------------------------
id                 Yes                    The id of a list to be updated
name               No                     New "Name" field of the list
from_name          No                     New "From Name" field in the list
reply_to           No                     New "Reply To" field in the list
organization       No                     New "Organization" field in the list's physical address
address1           No                     New "Address 1 line" field in the list's physical address
address2           No                     New "Address 2 line" field in the list's physical address
city               No                     New "City" field in the list's physical address
state              No                     New "State" field in the list's physical address
zip                No                     New "Zip" field in the list's physical address
country            No                     New "Country" field in the list's physical address

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X PUT -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
    -H "Content-type: application/json" \
    -d '{
        "id": 2,
        "name": "Customers list",
        "from_name": "Bill",
        "reply_to": "bill@expresspigeon.com"
    }' \
'https://api.expresspigeon.com/lists'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.Collections.map;
import static org.javalite.common.JsonHelper.toJsonString;
import static org.javalite.common.JsonHelper.toMap;

String content = toJsonString(map("id", 2,
        "name", "Customers list",
        "from_name", "Bill",
        "reply_to", "bob@expresspigeon.com"));
String response = Http.put("https://api.expresspigeon.com/lists", content)
        .header("X-auth-key", AUTH_KEY)
        .header("Content-type", "application/json")
        .text();
Map<String, Object> result = toMap(response);
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
$data = array(
  'id' => 2,
  'name' => 'Customers list',
  'from_name' => 'Bill',
  'reply_to' => 'bob@expresspigeon.com'
);
$options = array(
  'http' => array(
    'method' => 'PUT',
    'content' => json_encode($data),
    'header' => "Content-Type: application/json\r\n" .
                "X-auth-key: 00000000-0000-0000-0000-000000000000\r\n"
    )
);
$context = stream_context_create($options);
$result = file_get_contents('https://api.expresspigeon.com/lists', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'expresspigeon-ruby'

res = ExpressPigeon::API.lists.update list_id, :name => 'Real customers',
                                             :from_name => 'John', :reply_to => 'john@example.com'
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.lists.update(2, {"name": "Customers list", "from_name": "Bill", "reply_to": "bob@expresspigeon.com"})
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
{
    "status": "success",
    "code": 200,
    "message": "list=1 created/updated successfully",
    "list": {
        "id": 2,
        "name": "Customers list",
        "from_name": "Bill",
        "reply_to": "bill@expresspigeon.com",
        "contact_count": 0,
        "zip": "60089",
        "state": "IL",
        "address1": "113 N. McHenry",
        "address2": "#128",
        "city": "Buffalo Grove",
        "country": "USA",
        "organization": "ExpressPigeon",
        "created_at": "2013-01-21T12:27:36.000+0000"
    }
}       
~~~~


## Delete a List

> DELETE https://api.expresspigeon.com/lists/{id}

Removes a list with a given id. A list must be enabled and has no dependent subscriptions and/or scheduled campaigns.

**Request parameters**

Parameter          Required               Description
-------------      --------------------   --------------------------------
id                 Yes                    The id of a list to be removed

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}        
curl -X DELETE -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/lists/1'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toMap;

String response = Http.delete("https://api.expresspigeon.com/lists/2")
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
$result = file_get_contents('https://api.expresspigeon.com/lists/2', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'expresspigeon-ruby'

res = ExpressPigeon::API.lists.delete(list_id)
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.lists.delete(2)
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
{
    "status": "success",
    "code": 200,
    "message": "list=1 deleted successfully" 
}
~~~~


## Download Contacts from List

> GET https://api.expresspigeon.com/lists/{list_id}/csv

Removes a list with a given id. A list must be enabled and has no dependent subscriptions and/or scheduled campaigns.

**Request parameters**

Parameter          Required               Description
-------------      --------------------   --------------------------------
list_id            Yes                    A list id to select contacts from or "suppress_list" to select suppressed contacts

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}        
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/lists/123/csv'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;

String response = Http.get("https://api.expresspigeon.com/lists/123/csv")
                                .header("X-auth-key", AUTH_KEY).text();
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
$options = array('http' => array( 'method' => 'GET', 'header' => "X-auth-key: 00000000-0000-0000-0000-000000000000\r\n" ));
$context = stream_context_create($options);
$result = file_get_contents('https://api.expresspigeon.com/lists/123/csv', false, $context);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'lib/expresspigeon-ruby'

res = ExpressPigeon::API.lists.csv(list_id)
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.lists.csv(123)
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
"Email", "First name", "Last name", "City", "Phone", "Company", "Title", "Address 1", "Address 2", "State", "Zip", "Country", "Date of birth", "Created"
"bob@example.net","Bob",,,,,,,,,,,"2018-04-09 14:15:57"
~~~~


## Upload Contacts into List

> POST https://api.expresspigeon.com/lists/{id}/upload

Creates or merges contacts from uploaded CSV or zipped CSV file.

The request must use `multipart/form-data` with CSV or zipped CSV payload and `contacts_file` parameter pointed to CSV or zipped CSV file name.

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}        
curl -F "contacts_file=@list.csv;type=text/plain" \
    -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/lists/{list_id}/upload'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toMap;

String response = Http.multipart("https://api.expresspigeon.com/lists/" + listId + "upload")
        .header("X-auth-key", AUTH_KEY).file("contacts_file", "/path/to/list.csv").text();
Map<String, Object> result = toMap(response);
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
$file_content = file_get_contents('/path/to/list.csv');

$eol = "\r\n";
$data = '';
 
$mime_boundary=md5(time());
 
$data .= '--' . $mime_boundary . $eol;
$data .= 'Content-Disposition: form-data; name="contacts_file"; filename="list.csv"' . $eol;
$data .= 'Content-Type: text/plain' . $eol;
$data .= 'Content-Transfer-Encoding: base64' . $eol . $eol;
$data .= $file_content . $eol;
$data .= "--" . $mime_boundary . "--" . $eol . $eol;
 
$params = array('http' => array(
                  'method' => 'POST',
                  'header' => 'X-auth-key: 00000000-0000-0000-0000-000000000000' . $eol .
                              'Content-Type: multipart/form-data; boundary=' . $mime_boundary . $eol,
                  'content' => $data
               ));
 
$ctx = stream_context_create($params);
$response = file_get_contents('https://api.expresspigeon.com/lists/{list_id}/upload', FILE_TEXT, $ctx);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'lib/expresspigeon-ruby'

res = ExpressPigeon::API.lists.upload(list_id, '/tmp/contacts.csv')
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.lists.upload({list_id}, "/path/to/list.csv")
~~~~

</div>

</div>

The example above uses `list_id` in the URL. Please, make a note of it. The `list.csv` is a name of a local file filled with new or existing contacts.

**Example Response**

~~~~ {.js .numberLines}
{
    "status": "success",
    "code": 200,
    "message": "file uploaded successfully",
    "upload_id": 1
}           
~~~~

Processing uploaded lists takes some time, therefore after a successful upload call, you might need to check status of the upload. The `upload_id` should be used for checking the status your upload. Please, see a section below for more information.


## Check the Status of List Upload

> GET https://api.expresspigeon.com/lists/upload_status/{id}

Checks status of upload. If the upload was finished a detailed report is returned.

**Request parameters**

Parameter          Required               Description
-------------      --------------------   --------------------------------
id                 Yes                    The id of a list uploaded(this id was returned from "Upload contacts into list")

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}        
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/lists/upload_status/{upload_id}'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toMap;

String response = Http.get("https://api.expresspigeon.com/lists/upload_status/{upload_id}")
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
$result = file_get_contents('https://api.expresspigeon.com/lists/upload_status/{upload_id}', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'expresspigeon-ruby'

puts ExpressPigeon::API.lists.upload_status list_id
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.lists.upload_status({upload_id})
~~~~

</div>

</div>


**Example Response**

If upload was finished you will get a report

~~~~ {.js .numberLines}
{
    "message": "file upload completed",
    "status": "success",
    "code": 200,
    "report": {
        "completed": true,
        "failed": false,
        "suppressed": 0,
        "skipped": 0,
        "list_id": 1,
        "list_name": "Active customers",
        "merged": 1,
        "imported": 1
    }
}       
~~~~

If upload is still in progress you will get

~~~~ {.js .numberLines}
{
    "message": "file upload in progress",
    "status": "success",
    "code": 200,
    "report": {
        "completed": false,
        "failed": false,
        "suppressed": 0,
        "skipped": 0,
        "list_id": 1,
        "list_name": "Active customers",
        "merged": 0,
        "imported": 0
    }
}
~~~~
