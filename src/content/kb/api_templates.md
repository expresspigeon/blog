# Templates

## Copy template

> POST https://api.expresspigeon.com/templates/{id}/copy

This feature allow developers to create a copy of an email template and at the same time merge data into a new version. It makes it possible to have the following workflow:

1. Create a blank newsletter and add merge fields to it (using email editor)
2. Make a new copy of this newsletter, and merge specific data into it using this API
3. Send or schedule a new campaign with the API

Steps 2 and 3 can be done remotely with the API, without having to log into the website. Combined with ability to create new lists on the fly, and upload contacts, it provides an opportunity to build powerful marketing solutions.

**Request parameters**

Parameter          Required               Description
-------------      --------------------   --------------------------------
id                 Yes                    Template id to be used as a source
name               Yes                    Name for a new template
merge_fields       No                     Values of merge fields

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X POST -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
    -H "Content-type: application/json" \
    -d '{
        "name": "My new template",
        "merge_fields":{
        "menu": "<table class='report'><tr><td>Burger:</td></tr><tr>$9.99<td></td></tr></table>"
        }
    }' \
'https://api.expresspigeon.com/templates/123/copy'       
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
here java code
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
here php code
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
here ruby code
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
here python code
~~~~

</div>

</div>

> NOTE: It is important to use only single quotes in injected HTML

**Example Response**

~~~~ {.js .numberLines}
{
    "status": "success",
    "code": 200,
    "message": "template copied successfully",
    "template_id": 124
}           
~~~~

The `template_id` in the response document above is an ID of a newly created newsletter template which already contains all data merged.


## Delete template

> DELETE https://api.expresspigeon.com/templates/{id}

Delete single template by id

**Request parameters**

Parameter          Required               Description
-------------      --------------------   --------------------------------
id                 Yes                    Template id to be deleted

**Example Request**

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X DELETE -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/templates/123'       
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
here java code
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
here php code
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
here ruby code
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
here python code
~~~~

</div>

</div>

**Example Response**

~~~~ {.js .numberLines}
{
    "status": "success",
    "code": 200,
    "message": "template deleted successfully"
}           
~~~~

