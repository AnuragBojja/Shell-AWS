#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGFOLDER="/var/log/shell-logs"
mkdir -p "$LOGFOLDER"
LOGFILENAME=$( echo $0 | cut -d "." -f1)
LOGFILE="$LOGFOLDER/$LOGFILENAME.log"
echo "Log File Created at $LOGFILE"

if [ $USERID -ne 0 ]; then
    echo "Run this file with Root Privilage" &>> "$LOGFILE"
    exit 1
else 
    echo "This files running with Root Privilage" &>> "$LOGFILE"
fi

VALIDATOR(){
    if [ $1 -eq 0 ]; then
        echo "Installing $2 SUCCESSFUL" &>> "$LOGFILE"
    else
        echo "ERROR Installation $2"
    fi 
    echo -g "$G ................................... $N" &>> "$LOGFILE"
}

echo "$G ................................... $N" &>> "$LOGFILE"
dnf list installed mysql &>> "$LOGFILE"
if [ $? -ne 0 ]; then
    dnf install mysql -y &>> "$LOGFILE"
    VALIDATOR $? "MySQL"
else
    echo "$G MySQL is Already Installed $N" &>> "$LOGFILE"
fi

echo "$G ................................... $N" &>> "$LOGFILE"
dnf list installed python3 &>> "$LOGFILE"
if [ $? -ne 0 ]; then
    dnf install python3 -y &>> "$LOGFILE"
    VALIDATOR $? "Python3"
else
    echo "$G Python3 is Already Installed $N" &>> "$LOGFILE"
fi

echo "$G ................................... $N" &>> "$LOGFILE"
dnf list installed nginx &>> "$LOGFILE"
if [ $? -ne 0 ]; then
    dnf install nginx -y &>> "$LOGFILE"
    VALIDATOR $? "Nginx"
else
    echo "$G Nginx is Already Installed $N" &>> "$LOGFILE"
fi