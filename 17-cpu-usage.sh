#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
SPACE=2
IP_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)
MESSAGE=""
while IFS= read -r line
do
    USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
    PART=$(echo $line | awk '{print $7}')
    #echo "The usage of part $PART is $USAGE Per" 
    if [ $USAGE -gt $SPACE ]; then
        #echo "High Usage on $PART :: $USAGE Percentage"
        MESSAGE="High Usage on $PART :: $USAGE %"
    fi
done <<< $DISK_USAGE

echo "message body : $MESSAGE"