# Send a message with attachment

> POST https://api.expresspigeon.com/messages

## Request parameters

Request parameters are the same as when sending a [single message](#send-a-single-transactional-email) without attachments.

> Limitations are: maximum three attachments, each under 10mb in size.

## Example Request

<div class="tab-content">

<div role="tabpanel" data-language="curl" class="tab-pane active">

~~~~ {.prettyprint .numberLines}
curl -X POST https://api.expresspigeon.com/messages  \
    -H "Content-type: multipart/form-data" \
    -H "X-auth-key: 00000000-0000-0000-0000-000000000000"\
    -F template_id=123\
    -F reply_to='john@doe.com'\
    -F from='John Doe'\
    -F to='jane@doe.com'\
    -F subject='two attachments'\
    -F merge_fields='{"first_name": "Jane"}'\
    -F attachment=@attachment1.txt\
    -F attachment=@attachment2.txt
~~~~

</div>

<div role="tabpanel" data-language="java" class="tab-pane">

~~~~ {.java .numberLines}
import org.javalite.http.Http;
import static org.javalite.common.Collections.map;
import static org.javalite.common.JsonHelper.toJsonString;
import static org.javalite.common.JsonHelper.toMap;

String response = Http.multipart("https://api.expresspigeon.com/messages")
        .header("X-auth-key", AUTH_KEY)
        .file("attachment", "/path/to/attachment1.txt")
        .file("attachment", "/path/to/attachment2.txt")
        .field("template_id", "123")
        .field("reply_to", "john@doe.com")
        .field("from", "John Doe")
        .field("to", "jane@doe.com")
        .field("subject", "two attachments")
        .field("merge_fields", toJsonString(map("first_name", "Jane")))
        .text();
Map<String, Object> result = toMap(response);
~~~~

</div>

<div role="tabpanel" data-language="php" class="tab-pane">

~~~~ {.php .numberLines}
$attachement1 = file_get_contents('/path/to/attachement1.txt');
$attachement2 = file_get_contents('/path/to/attachement2.txt');

$eol = "\r\n";
$data = '';

$mime_boundary=md5(time());

$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="template_id"' . $eol . $eol;
$data .= "123" . $eol;
$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="reply_to"' . $eol . $eol;
$data .= "john@doe.com" . $eol;
$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="from"' . $eol . $eol;
$data .= "John Doe" . $eol;
$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="to"' . $eol . $eol;
$data .= "jane@doe.com" . $eol;
$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="subject"' . $eol . $eol;
$data .= "two attachments" . $eol;
$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="view_online"' . $eol . $eol;
$data .= "true" . $eol;
$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="suppress_address"' . $eol . $eol;
$data .= "true" . $eol;
$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="click_tracking"' . $eol . $eol;
$data .= "false" . $eol;
$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="merge_fields"' . $eol . $eol;
$data .= json_encode(array('first_name' => 'Jane')) . $eol;
$data .= '--' . $mime_boundary . $eol;

$data .= 'Content-Disposition: form-data; name="attachment"; filename="attachment1.txt"' . $eol;
$data .= 'Content-Type: text/plain' . $eol;
$data .= 'Content-Transfer-Encoding: base64' . $eol . $eol;
$data .= $attachement1 . $eol;
$data .= "--" . $mime_boundary . "--" . $eol . $eol;
$data .= 'Content-Disposition: form-data; name="attachment"; filename="attachment2.txt"' . $eol;
$data .= 'Content-Type: text/plain' . $eol;
$data .= 'Content-Transfer-Encoding: base64' . $eol . $eol;
$data .= $attachement2 . $eol;
$data .= "--" . $mime_boundary . "--" . $eol . $eol;

$params = array('http' => array(
                  'method' => 'POST',
                  'header' => 'X-auth-key: 00000000-0000-0000-0000-000000000000'  . $eol .
                              'Content-Type: multipart/form-data; boundary=' . $mime_boundary . $eol,
                  'content' => $data
               ));

$ctx = stream_context_create($params);
$response = file_get_contents('https://api.expresspigeon.com/messages', FILE_TEXT, $ctx);
~~~~

</div>

<div role="tabpanel" data-language="ruby" class="tab-pane">

~~~~ {.ruby .numberLines}
require 'expresspigeon-ruby'
MESSAGES = ExpressPigeon::API.messages.auth_key(ENV['AUTH_KEY'])
puts MESSAGES.send_message(
    390243,                                                 #template_id
    'john@example.com',                                     #to
    'jane@example.com',                                     #reply_to
    "Jane Doe",                                             #from_name
    "Lets go out for dinner?",                              #subject
    {first_name: 'John', meeting_place: 'Downtown'},        #merge_fields
    %W{attachments/attachment1.txt attachments/example.ics} #files as attachments
)
~~~~

</div>

<div role="tabpanel" data-language="python" class="tab-pane">

~~~~ {.python .numberLines}
from expresspigeon import ExpressPigeon

api = ExpressPigeon()
response = api.messages.send_message_attachment(template_id=123, attachments=["path/to/attachment1.txt", "path/to/attachment2.txt"],
                                      to="jane@example.net",
                                      reply_to="john@example.net", from_name="John", subject="Dinner served",
                                      merge_fields={"first_name": "John", "menu": "<table><tr><td>Burger:</td></tr><tr>$9.99<td></td></tr></table>"})
~~~~

</div>

</div>

Code above shows how to include attachments. The paths to files can be absolute, or relative (as in this example).

## Example Response

~~~~ {.js .numberLines}
{
    "status": "success",
    "code": 200,
    "id": 1,
    "message": "email queued"
}
~~~~

In a call above, the `id` represents an ID of a message that was sent. You can use this value in order to get a report on status of this message. Please, see below on how to retrieve such a report.
