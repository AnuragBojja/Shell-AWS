#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then 
    echo -e "$R ERROR: Run this with root privelege $N"
    exit 1 
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then 
        echo -e "$R ERROR: installing $2 is failure $N"
        exit 1
    else
        echo -e "$G Installing $2 is success$N"
    fi
}

dnf install mysql -y
VALIDATE $? "MySql"

dnf install nginx -y
VALIDATE $? "Nginx"

dnf install python3 -y
VALIDATE $? "python3"