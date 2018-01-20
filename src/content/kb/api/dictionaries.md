# Dictionaries for deep personalization

Dictionaries allow for endless personalization of content for each contact.
 If you use [contact fields](contact-fields), you are limited to standard fields like first name,  last name and around
 20 custom fields. Even though our custom fields are generous at 1000 characters each, it
   may not be enough in number and size. 

If you run out of the limit with [contact fields](contact-fields), you can use dictionaries. 
 
Your content can be loaded into dictionaries, which can be images, entire paragraphs, text or any other content, and
then  you can cross-reference content and people. This way, you can have as many "custom fields" as you need. 
In some extreme cases, our customers have loaded a few hundred thousand of their products into our system and 
cross-referenced them across hundreds of thousands of their subscribers. 

> Dictionaries add the capability to store name/value pairs on your account to merge into templates. 

They remove the need to send the same data over and over to the API and allow you to endlessly expand the merging options
for your audience.

A single dictionary may represent a product with attributes, where each attribute name is 
some property of a product (name, description, price, URL to image, etc.). 

In other cases, a dictionary can be a set of internationalized messages, 
where each dictionary is a collection of messages in different languages (English, French, etc.)

## Concepts

Example
A dictionary has a name and a number of key/value pairs. For example:


Dictionary name: **sandwitch1**

Key               Value
-------------     ------- 
name              Turkey Pastrami
image_url         \<img src='http://sandwitchblink.com/images/turkey.png'>


Dictionary name: **sandwitch2**

Key               Value
-------------     ------- 
name              Rye Ruben
image_url         \<img src='http://sandwitchblink.com/images/ruben.png'>


In addition, we allow creation of up to 20 special dictionary mapping sets. Dictionary Mapping
sets exist for each and every contact and allow to map a contact to data stored in dictionaries
during a merge process.

Dictionary Mappings (also called recommendation sets) for contacts contain so-called JSON documents. Example of such document for one
subscriber:

```json 
{
  "name"        : "sandwich1.name",
  "description" : "sandwich1.description",    
  "price"       : "sandwich1.price", 
  "image_url"   : "sandwich1.url" 
}
```

and for another subscriber:

```json 
{
  "name"        : "sandwich2.name",
  "description" : "sandwich2.description",    
  "price"       : "sandwich2.price", 
  "image_url"   : "sandwich2.url" 
}
```

Each document is loaded into a corresponding Mapping Set for each contact. You can configure up to 20 such
sets per contact. In the documents above, the keys are placeholders matching template merge tags, and
values are pointers to specific dictionary keys. 

The newsletter template will simply refer to merge fields using keys from the JSON
documents:
```html
<html> 
<body>
Best sandwich money can buy: ${name}!<br>

Satisfy your hunger:
<hr>
     ${image_url}
</body>
</html>
```

This will result in the first subscriber to see offer for `sandwich1`, and the second will see the `sandwich2` from the dictionary.

Merging process: 

When we process this template for a customer, we: 

1. Look for a placeholder, let's say we found: `${name}`.
2. Look for that in a recommendation set for a currently processed contact and find a mapping: `name` -> `sandwich1.name`. 
3. Navigate to a dictionary `sandwich1` and pull up a value of its attribute `name`. 
4. Use that value to merge into a template. 

## Steps to send a campaign

Setting up a campaign with dictionaries follow  these steps:

1. Create a newsletter and add merge placeholders
2. Create dictionaries and name/value pairs (offers)
3. Upload list of contacts and dictionary mappings
4. Trigger campaign and select the dictionary mapping set submitted in step 3

A personalized campaign will be send, where each contact will be getting content that was set according 
 to dictionaries and personal mappings. 
 
## Dictionary Mappings Rotations and View Online
 
 ExpressPigeon provides 20 dictionary sets. This allows customers to rotate them in and out of
 campaigns.
 
 For example, if a field 1 was used today, a sender has 19 more fields left to map subscribers
 to products before they run out.
 
 When a customer clicks “View online” link, EP displays the same newsletter in browser. If the
 corresponding mapping field is preserved, EP will display a merged newsletter
 with exactly the same content as was sent. If the merge field was augmented, EP will display
 products that map to new values. This feature can be used to advantage when selling
 perishable products or any content that expires. 
 
## Semi-Automated Campaigns

 Dictionary Mappings make possible some interesting scenarios. Lets say dictionary mappings
 are loaded, an so are lists of contacts. Newsletter are created and use keys from dictionary
 mapping documents. At this point, the sender can simply update data in the dictionary pairs
 using API, and trigger new campaigns.
 
 
 ## Merge preview in UI
 
You can preview a template for a specific person an have all dictionary data as well as custom fields
merged. This allows to view the email complete with merged data for an individual before sending.

Here are the steps: 

* Click Preview button in the email editor.
* Select a recommendation set (one of twenty).
* Search for a contact in hte search field.
* When you click the contact you found, th preview will render a template according to dictionaries and recommendations.

 
## API usage

### Create or update dictionaries

> https://api.expresspigeon.com/dictionaries

You can create multiple dictionaries in a single API call (do not forget to set Content-type header to `application/json`).

**Request Parameters**

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


### Listing Dictionaries with UI

You can see and edit dictionaries using a browser. First, login into your account, and navigate to 
[https://expresspigeon.com/dictionaries](https://expresspigeon.com/dictionaries).

Enter * or a dictionary name into the search field and press Enter.


### Listing Dictionaries

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


### Get a single dictionary

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



### Deleting dictionary

curl -X DELETE -H "X-auth-key: XXXX"  https://api.expresspigeon.com/dictionaries/dict_id


### Create a file with mappings

This is simply a text file that has the following format:

```
john@doe.com {"productx":"dict1.product1","producty":"dict1.product4","salex":"dict1.sale1","saley":"dict1.sale2"}
jane@doe.com {"productx":"dict2.product1","producty":"dict2.product4","salex":"dict2.sale1","saley":"dict2.sale2"}
```

Each line is expected to have an email address that corresponds to a contact followed by space, followed by a JSON document that 
contains mappings for this contact.

The mappings file needs to be zipped. File name can be anything, and zipped file name can be anything as well. 
Only one file inside a zip is expected.

Example:

* Text file: `mappings.txt`
* Zip file:  `mappings.txt.zip`

### Upload mappings file

```
curl -H "X-auth-key: XXXX" -H "Content-Type: octet/stream" \
--data-binary @mappings.txt.zip https://api.expresspigeon.com/dictionaries/mapping/dictionary_mapping_X
```


Where the `X` can span the values from 1 to 20, depending what recommendation set you need to update. 

### Sending a campaign

Sending a campaign with dictionaries is similar to sending a regular campaign. 
  You just need to include a `dictionary_mapping` argument:  

```
curl -X POST -H "X-auth-key: XXXX" -H "Content-type: application/json" -d \'
{ 
    "list_id":"293",
    "template_id" : "20047", "name": "Merge campaign test",
    "from_name" : "Igor", \
    "reply_to" : "igor@expresspigeon.com", "subject" : "${producty} ${salex}",
    "google_analytics" : "false",\
    "dictionary_mapping": "dictionary_mapping_1"
}'
https://api.expresspigeon.com/campaigns
```

For more information, see [campaign creation](campaigns#campaigns-creation).

### Where to see mappings

You can browse to any conmtact details screen and click on the "Recommendation mappings" tab for that contact: 

![](images/dictionaries.png)

that will allow you to see recommendation mappings for that contact in the same JSON format:  

![](images/dictionaries1.png)

