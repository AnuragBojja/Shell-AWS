#!/bin/bash
TO_ADDRESS=$1
SUBJECT=$2
ALERT_TYPE=$3
EMAIL_BODY=$4
#FORMATTED_BODY=$(printf '%s\n' "$EMAIL_BODY" | sed -e 's/[]\/$*.^[]/\\&/g')
# 1) Convert real newlines to <br> for HTML (keeps readability in mail)
HTML_BODY=$(printf '%s' "$EMAIL_BODY" | sed 's/$/<br>/')

# 2) Escape characters that break sed replacement: \, &, and the delimiter we will use (|)
ESCAPED_BODY=$(printf '%s' "$HTML_BODY" | sed -e 's/[\\&|]/\\&/g')IP_ADDRESS=$5
TO_TEAM=$6

FINAL_BODY=$(sed -e "s/TO_TEAM/$TO_TEAM/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/IP_ADDRESS/$IP_ADDRESS/g" -e "s/EMAIL_BODY/$ESCAPED_BODY/g" template.html)
{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$FINAL_BODY"
} | msmtp "$TO_ADDRESS"