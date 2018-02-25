#!/bin/sh

BASE_URL="https://www.explainshell.com/explain?"

COMMAND=$1
echo $COMMAND

URL_ENCODED_COMMAND=$(python $HABITAT/scripts/urlencode.py cmd "$COMMAND")
echo $URL_ENCODED_COMMAND

FULL_URL=${BASE_URL}${URL_ENCODED_COMMAND}
echo $FULL_URL
x-www-browser $FULL_URL