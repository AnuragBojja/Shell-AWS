#!/bin/bash


USERID=$(id -u)


if [ USERID -ne 0 ]; then
    echo "Run this file with Root User"
    exit 1
else 
    echo "This files running with Root User"
fi


