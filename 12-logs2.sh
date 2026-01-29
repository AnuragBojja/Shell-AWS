#!/bin/bash


USERID=$(id -u)


if [ $USERID -ne 0 ]; then
    echo "Run this file with Root User"
    exit 1
else 
    echo "This files running with Root User"
fi
VALIDATOR(){
    if [ $1 -eq 0 ]; then
        echo "Installing $2 SUCCESS"
    else
        echo "ERROR Installation $2"
    fi 
}
dnf install mysql -y
VALIDATOR $? "MySQL"
