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

if [ "$USERID" -ne 0 ]; then
    echo "Run this file with Root Privilage" &>> "$LOGFILE"
    echo "Run this file with Root Privilage"
    exit 1
else 
    echo "This files running with Root Privilage" &>> "$LOGFILE"
    echo "This files running with Root Privilage"
fi

VALIDATOR(){
    if [ "$1" -eq 0 ]; then
        echo "Installing $2 SUCCESSFUL" &>> "$LOGFILE"
        echo -e "$Y Installing $2 SUCCESSFUL $N"
    else
        echo "ERROR Installation $2" &>> "$LOGFILE"
        echo -e "$R ERROR Installation $2 $N"
        exit 1
    fi 
    echo " ................................... " &>> "$LOGFILE"
    echo -e "$G ................................... $N"
}

echo " ................................... " &>> "$LOGFILE"
echo -e "$G ................................... $N"
dnf list installed mysql &>> "$LOGFILE"
if [ $? -ne 0 ]; then
    dnf install mysql -y &>> "$LOGFILE"
    VALIDATOR $? "MySQL"
else
    echo "MySQL is Already Installed" &>> "$LOGFILE"
    echo -e "$G MySQL is Already Installed $N"
fi

echo "..................................." &>> "$LOGFILE"
echo -e "$G ................................... $N"
dnf list installed python3 &>> "$LOGFILE"
if [ $? -ne 0 ]; then
    dnf install python3 -y &>> "$LOGFILE"
    VALIDATOR $? "Python3"
else
    echo "Python3 is Already Installed" &>> "$LOGFILE"
    echo -e "$G Python3 is Already Installed $N"
fi

echo "..................................." &>> "$LOGFILE"
echo -e "$G ................................... $N"
dnf list installed nginx &>> "$LOGFILE"
if [ $? -ne 0 ]; then
    dnf install nginx -y &>> "$LOGFILE"
    VALIDATOR $? "Nginx"
else
    echo "Nginx is Already Installed" &>> "$LOGFILE"
    echo -e "$G Nginx is Already Installed $N"
fi