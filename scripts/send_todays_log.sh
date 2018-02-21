now=`date +"%Y-%m-%d"`
filepath=~/Documents/Logs/$now-log.md
markdown_string=`cat ${filepath}`

export TODAYS_LOG_MD=$markdown_string
# TODO: Write custom Python script that parses Github Markdown to Slack markdown
curl -X POST -H "Authorization: Bearer ${SLACK_API_TOKEN}" \
-H 'Content-type: application/json' \
--data "$(python -c 'import json, os, sys; print json.dumps({
    "channel": os.getenv("SLACK_RAVELIN_ME"),
    "text": os.getenv("TODAYS_LOG_MD"),
})')" \
https://slack.com/api/chat.postMessage
unset TODAYS_LOG_MD

echo # To create a new line after curl