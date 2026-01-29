#!/bin/bash

USERID=$(id -u)

LOGFOLDER="/var/log/shell-logs"
mkdir -p $LOGFOLDER
LOGFILENAME=$( echo $0 | cut -d "." -f1)
LOGFILE="$LOGFOLDER/$LOGFILENAME.log"
echo "Log File Created at $LOGFILE"

if [ $USERID -ne 0 ]; then
    echo "Run this file with Root Privilage" &>> $LOGFILE
    exit 1
else 
    echo "This files running with Root Privilage" &>> $LOGFILE
fi

VALIDATOR(){
    if [ $1 -eq 0 ]; then
        echo "Installing $2 SUCCESSFUL"
    else
        echo "ERROR Installation $2"
    fi 
    echo "...."
    echo "...."
    echo "...."
    echo "...."
    echo "...."
    echo "...."
    echo "...."
    echo "...."
}

dnf install mysql -y &>> $LOGFILE
VALIDATOR $? "MySQL"

dnf install python3 -y &>> $LOGFILE
VALIDATOR $? "Python3"

dnf install nginx -y &>> $LOGFILE
VALIDATOR $? "Nginx"