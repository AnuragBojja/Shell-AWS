#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
SPACE=2
IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)
MESSAGE=""
while IFS= read -r line
do
    USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
    PART=$(echo $line | awk '{print $7}')
    #echo "The usage of part $PART is $USAGE Per" 
    if [ $USAGE -gt $SPACE ]; then
        #echo "High Usage on $PART :: $USAGE Percentage"
        MESSAGE+="High Usage from $IP_ADDRESS on $PART :: $USAGE % <br>"
    fi
done <<< $DISK_USAGE
SHELL_MESSAGE=$(sed "s/<br>/\n/g" $MESSAGE)
echo -e "message body : $SHELL_MESSAGE"
#printf '%s' "$MESSAGE" #| sed -e 's/[]\/$*.^[]/\\&/g'
sh 18-mail.sh "anuragbojja19@gmail.com" "High Disk Usage Alert" "High Disk Usage" "$MESSAGE" "$IP_ADDRESS" "DevOps Team"

# TO_ADDRESS=$1
# SUBJECT=$2
# ALERT_TYPE=$3
# EMAIL_BODY=$4
# IP_ADDRESS=$5