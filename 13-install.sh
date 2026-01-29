#!/bin/bash

USERID=$(id -u)

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
    dnf list installed "pkg"
    if [ $? -ne 0 ]; then 
        dnf install "pkg" -y
        VALIDATOR $? "pkg"
    else
        echo "$pkg Already Installed"
    fi 
}
INSTALLING_APPLICATION mysql
INSTALLING_APPLICATION nginx