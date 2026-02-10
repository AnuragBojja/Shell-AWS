#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
USERID=$(id -u)
LOGFOLDER="/var/log/shell-logs"
mkdir -p "$LOGFOLDER"
LOGFILENAME=$( echo $0 | cut -d "." -f1)
LOGFILE="$LOGFOLDER/$LOGFILENAME.log"
SOURCE_DIR="$1"
DEST_FILE="$2"
DAYS=${3:-14}
echo "Script started executed at: $(date)"

if [ "$USERID" -ne 0 ]; then
    echo "Run this file with Root Privilage" &>> "$LOGFILE"
    echo "Run this file with Root Privilage"
    exit 1
else 
    echo "This files running with Root Privilage" &>> "$LOGFILE"
    echo "This files running with Root Privilage"
fi
USAGE(){
    echo -e "$Y USAGE::sudo sh <file-name>.sh <source-dir> <dest-dir> <how-older-files>(Optional) default 14days older files $N"
    exit 1
}
if [ $# -lt 2 ] || [ $# -gt 3 ]; then
    USAGE
fi
if [ ! -d "$SOURCE_DIR" ]; then
    echo -e "$R There is no such directory as $SOURCE_DIR $N"
    exit 1
fi
echo -e "$Y Directory $SOURCE_DIR Found $N"
if [ ! -d "$DEST_FILE" ]; then
    echo -e "$R There is no such directory as $DEST_FILE $N"
    exit 1
fi
echo -e "$Y Directory $DEST_FILE Found $N"
FILES=$(find "$SOURCE_DIR" -name "*.log" -type f -mtime +"$DAYS")

if [ ! -z "${FILES}" ]; then 
    echo -e "$G Files Found $FILES $N"
    TIMESTAMP=$(date +%F-%H-%M)
    ZIP_FILE="$DEST_FILE/app-logs-$TIMESTAMP.zip"
    echo -e "$Y Zip File Name : $N $ZIP_FILE"
    find "$SOURCE_DIR" -name "*.log" -type f -mtime +"$DAYS" | zip -@ -j "$ZIP_FILE"
else echo -e "$R NO Files Found $N"
    exit 1
fi
