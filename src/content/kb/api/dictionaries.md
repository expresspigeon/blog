# Dictionaries

Dictionaries are a capability to store name/value pairs on your account to merge into templates. They remove the need to send the same data over and over to the API.

A single dictionary may represent a product with attributes, where each attribute name is some property of a product (name, description, price, URL to image, etc.). In other cases, a dictionary can be a set of internationalized messages, where each dictionary is a collection of messages in different languages (English, French, etc.)

## Create a new dictionary

> https://api.expresspigeon.com/dictionaries

You can create multiple dictionaries in a single API call.

Please, do not forget to set content-type to `application/json`

**Request parameters**

Parameter         Required               Description
-------------     --------------------   --------------------------------
name              Yes                    Name of a new or existing dictionary
values            Yes                    Collection of name/value pairs

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X POST -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
    -H "Content-type: application/json"
    -d \
    '[{
    "name": "sandwich1",
    "values": {
        "name": "ORGANIC GRASS FED SIRLOIN",
        "price": "$7.00",
        "image": "http://yourdomain.com/contnet/sandwich1.png",
        "url": "http://yourdomain.com/sandwich1",
        "description": "certified organic grass fed sirloin, Swiss Gruyère cheese, vine tomatoes, organic mixed greens, caramelized organic onions and housemade horseradish aioli on organic bretzel baguette"
        }
    },
    {
    "name": "sandwich2",
    "values": {
        "name": "ORGANIC ROASTED TOFU",
        "price": "$4.99",
        "image": "http://yourdomain.com/contnet/sandwich1.png",
        "url": "http://yourdomain.com/sandwich2",
        "description": "certified organic smoked turkey, local white cheddar, fresh organic apple crisps, organic mixed greens and housemade roasted pepper aioli on organic bretzel baguette"
        }
    }]'
'https://api.expresspigeon.com/dictionaries'      
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.Collections.map;
import static org.javalite.common.Collections.list;
import static org.javalite.common.JsonHelper.toJsonString;
import static org.javalite.common.JsonHelper.toMap;

String content = toJsonString(list(
        map("name", "sandwich1",
            "values", map("name", "ORGANIC GRASS FED SIRLOIN", 
                        "price", "$7.00", 
                        "image", "http://yourdomain.com/contnet/sandwich1.png",
                        "url", "http://yourdomain.com/sandwich1",
                        "description", "certified organic grass fed sirloin, Swiss Gruyère cheese, vine tomatoes, organic mixed greens, caramelized organic onions and housemade horseradish aioli on organic bretzel baguette")
            ),
        map("name", "sandwich2",
            "values", map("name", "ORGANIC ROASTED TOFU", 
                        "price", "$4.99", 
                        "image", "http://yourdomain.com/contnet/sandwich1.png",
                        "url", "http://yourdomain.com/sandwich2",
                        "description", "certified organic smoked turkey, local white cheddar, fresh organic apple crisps, organic mixed greens and housemade roasted pepper aioli on organic bretzel baguette")
)));
String response = Http.post("https://api.expresspigeon.com/dictionaries", content)
        .header("X-auth-key", AUTH_KEY)
        .header("Content-type", "application/json")
        .text();
Map<String, Object> result = toMap(response);
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
$data = array(
    array('name' => 'sandwich1',
        'values' => array('name' => 'ORGANIC GRASS FED SIRLOIN',
                'price' => '$7.00',
                'image' => 'http://yourdomain.com/contnet/sandwich1.png',
                'url' => 'http://yourdomain.com/sandwich1',
                'description' => 'certified organic grass fed sirloin, Swiss Gruyère cheese, vine tomatoes, organic mixed greens, caramelized organic onions and housemade horseradish aioli on organic bretzel baguette')
            ),
    array('name' => 'sandwich2',
        'values' => array('name' => 'ORGANIC ROASTED TOFU',
                'price' => '$4.99',
                'image' => 'http://yourdomain.com/contnet/sandwich1.png',
                'url' => 'http://yourdomain.com/sandwich2',
                'description' => 'certified organic smoked turkey, local white cheddar, fresh organic apple crisps, organic mixed greens and housemade roasted pepper aioli on organic bretzel baguette')
            )
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
$result = file_get_contents('https://api.expresspigeon.com/dictionaries', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
Ruby example coming soon!
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.dictionaries.create([{
    "name": "sandwich1",
    "values": {
        "name": "ORGANIC GRASS FED SIRLOIN",
        "price": "$7.00",
        "image": "http://yourdomain.com/contnet/sandwich1.png",
        "url": "http://yourdomain.com/sandwich1",
        "description": "certified organic grass fed sirloin, Swiss Gruyère cheese, vine tomatoes, organic mixed greens, caramelized organic onions and housemade horseradish aioli on organic bretzel baguette"
        }
    },
    {
    "name": "sandwich2",
    "values": {
        "name": "ORGANIC ROASTED TOFU",
        "price": "$4.99",
        "image": "http://yourdomain.com/contnet/sandwich1.png",
        "url": "http://yourdomain.com/sandwich2",
        "description": "certified organic smoked turkey, local white cheddar, fresh organic apple crisps, organic mixed greens and housemade roasted pepper aioli on organic bretzel baguette"
        }
    }])
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
{
    "code":200,
    "ids":[123,456],
    "message":"dictionaries created/updated successfully",
    "status":"success"
}    
~~~~

Where 123 and 456 are IDs of created or updated dictionaries.


## Listing dictionaries with UI

You can see and edit dictionaries using a browser. First, login into your account, and navigate to [https://expresspigeon.com/dictionaries](https://expresspigeon.com/dictionaries).

Enter * or a dictionary name into the search field and press Enter.


## Listing dictionaries

> https://api.expresspigeon.com/dictionaries

Allows to list multiple dictionaries.

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/dictionaries'     
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toList;

String response = Http.get("https://api.expresspigeon.com/dictionaries")
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
$result = file_get_contents('https://api.expresspigeon.com/dictionaries', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
Ruby example coming soon!
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.dictionaries.find_all()
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
[{
    "id":1,
    "updated_at":"2014-05-14T21:58:31.000+0000",
    "name":"dict1",
    "created_at":"2014-05-14T21:58:31.000+0000"
},
{
    "id":2,
    "updated_at":"2014-05-14T21:58:31.000+0000",
    "name":"dict2",
    "created_at":"2014-05-14T21:58:31.000+0000"
}]            
~~~~


## Get a single dictionary

> https://api.expresspigeon.com/dictionaries

Lookup a single dictionary

**Example Request**

<div class="tab-content">
 
<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/dictionaries/dict_id'  
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toMap;

String response = Http.get("https://api.expresspigeon.com/dictionaries/dict_id")
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
$result = file_get_contents('https://api.expresspigeon.com/dictionaries/dict_id', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
Ruby example coming soon!
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon
    
api = ExpressPigeon()
response = api.dictionaries.lookup(dict_id)
~~~~

</div>

</div>

Where "dict_id" is a dictionary ID.

**Example Response**
 
~~~~ {.js .numberLines}
{
    "id":1,
    "values":[
        {"name":"product1","value":"Swing set"},
        {"name":"product2","value":"Weber grill"},
        {"name":"product3","value":"IPhone"},
        {"name":"product4","value":"Eye glasses"},
        {"name":"sale1","value":"30% off"},
        {"name":"sale2","value":"50% off"}],
    "updated_at":"2014-05-14T21:58:31.000+0000",
    "name":"dict1",
    "created_at":"2014-05-14T21:58:31.000+0000"
}       
~~~~