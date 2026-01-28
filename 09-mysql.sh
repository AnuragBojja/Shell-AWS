#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0]; then 
    echo "run this with root privelege"
fi

dnf install mysql -y

if [ $? -ne 0]; then 
    echo "ERROR: installing mysql is failure"
else
    echo "Installing mysql is success"
fi