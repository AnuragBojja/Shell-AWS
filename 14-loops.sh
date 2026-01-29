#!/bin/bash

USERID=$(id -u)
LOGFOLDER="/var/log/shell-logs"
mkdir -p "$LOGFOLDER"
LOGFILENAME=$( echo $0 | cut -d "." -f1)
LOGFILE="$LOGFOLDER/$LOGFILENAME.log"
echo "Log File Created at $LOGFILE"

if [ "$USERID" -ne 0 ]; then
    echo "Please Run With Root Privilage"
    exit 1
else
    echo "This file running with Root Privilage"
fi

VALIDATOR(){
    if [ "$1" -ne 0 ]; then
        echo "ERROR installing $2"
        exit 1
    else
        echo "Installing $2 SUCCESS"
    fi
}

INSTALLING_APPLICATION(){
    local pkg="$1"
    dnf list installed "$pkg"
    local STATUS="$?"
    if [ "$STATUS" -ne 0 ]; then 
        echo "Installing..... $pkg ........."
        dnf install "$pkg" -y &>> "$LOGFILE"
        local PKG_STATUS="$?"
        VALIDATOR "$PKG_STATUS" "$pkg"
    else
        echo "SUCCESS $pkg Already Installed SUCCESS"
    fi 
}

for PACKAGE in $@
do
    INSTALLING_APPLICATION "$PACKAGE"
done