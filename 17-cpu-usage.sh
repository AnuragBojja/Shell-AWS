#!/bin/bash

DISK_USAGE=$(df -hT | grep -v Filesystem)

while IFS= read -r line
do
    USAGE=$(echo $line | awk '{print $6}' | cut -d "%" -f1)
    PART=$(echo $line | awk '{print $7}')
    echo "The usage of part $PART is $USAGE Per" 
done <<< $DISK_USAGE