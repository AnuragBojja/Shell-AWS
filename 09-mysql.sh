#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
    echo "ERROR: Run this with root privelege"
    exit 1 
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then 
        echo "ERROR: installing $2 is failure"
        exit 1
    else
        echo "Installing $2 is success"
    fi
}

dnf install mysql -y
VALIDATE $? "MySql"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install mongodb-mongosh -y
VALIDATE $? "mongodb-mongosh"