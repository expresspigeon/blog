# Report for multiple messages

> GET https://api.expresspigeon.com/messages/{period}

Returns a report (ordered by id) for at most 1000 of transactional emails sent with this API, to get the next batch use
`from_id` parameter.

## Request parameters

Parameter          Required                Description
-------------      --------------------    --------------------------------
start_date         `No`                    Start of the reporting period (UTC, example: 2013-03-16T10:00:00.000+0000)
end_date           `No`                    End of the reporting period (UTC, example: 2013-03-16T20:00:00.000+0000)
period             `No`                    Predefined reporting period: `last24hours`, `last_week`, `last_month`
from_id            `No`                    Id from where to get the next batch, e.g. the last id from the report

## Example Request


<!--TODO I think we are missing examples for period parameter: last24hours, last_week, last_month -->
<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -H "X-auth-key: 00000000-0000-0000-0000-000000000000" \
'https://api.expresspigeon.com/messages'
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.JsonHelper.toList;

String response = Http.get("https://api.expresspigeon.com/messages")
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
$result = file_get_contents('https://api.expresspigeon.com/messages', false, $context);
$response = json_decode($result);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'expresspigeon-ruby'

# first 1000 reports
response =  ExpressPigeon::API.messages.reports
# first 1000 reports starting with specific ID
response =  ExpressPigeon::API.messages.reports start_id
# first 1000 reports starting with specific ID and limit by time box
response =  ExpressPigeon::API.messages.reports start_id, Time.utc(2016, 01, 13, 13), Time.utc(2016, 01, 25, 13)
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon

api = ExpressPigeon()
response = api.messages.reports()
~~~~

</div>

</div>

## Example Response

~~~~ {.js .numberLines}
[{
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
},
{
    "id": 2,
    "email": "bob@example.net",
    "in_transit": false,
    "delivered": true,
    "bounced": false,
    "opened": false,
    "clicked": false,
    "urls": [],
    "spam": false,
    "created_at": "2013-04-15T11:20:21.770+0000",
    "updated_at": "2013-04-16T11:22:23.210+0000"
}]
~~~~


## Getting multiple pages

If you ran a report and got exactly 1000 documents, there is a chance that there is more for the date range.
You will need to write a loop that uses the `from_id` parameter to get the next window of documents.
Simply use the ID from a previous resultset' last item to get the next block.  Once you get fewer than 
1000 results, or no results, you are done!

