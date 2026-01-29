#!/bin/bash


USERID=$(id -u)


if [ $? -ne 0]; then
    echo "Run this file with Root User"
    exit 1
else 
    echo "This files run with Root User"
fi


