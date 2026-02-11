#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)
SPACE="2"
while IFS= read -r line
do
    USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
    PART=$(echo $line | awk '{print $7}')
    #echo "The usage of part $PART is $USAGE Per" 
    if [ "$USAGE" -gt SPACE ]; then
        echo "High Usage on $PART :: $USAGE Percentage"
    fi
done <<< $DISK_USAGE