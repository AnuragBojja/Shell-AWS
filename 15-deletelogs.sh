#!/bin/bash
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

if [ ! -d SOURCE_DIR ]; then
    echo "There is no such directory as $SOURCE_DIR"
fi
