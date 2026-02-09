#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=($?)
LOGFOLDER="/var/log/shell-logs"
mkdir -p "$LOGFOLDER"
LOGFILENAME=$( echo $0 | cut -d "." -f1)
LOGFILE="$LOGFOLDER/$LOGFILENAME.log"
echo "Script started executed at: $(date)"

if [ "$USERID" -ne 0 ]; then
    echo "Run this file with Root Privilage" &>> "$LOGFILE"
    echo "Run this file with Root Privilage"
    exit 1
else 
    echo "This files running with Root Privilage" &>> "$LOGFILE"
    echo "This files running with Root Privilage"
fi

SOURCE_DIR="/home/ec2-user/app-logs"

if [ ! -d $SOURCE_DIR ]; then
    echo "There is no such directory as $SOURCE_DIR"
fi
echo -e "$Y $SOURCE_DIR Found $N"

FILE_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -type f -mtime +14)

while IFS= read -r -d file; do
  echo "Processing file: $file"
done <<< SOURCE_DIR
