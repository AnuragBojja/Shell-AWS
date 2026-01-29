#!/bin/bash

USERID=$(id -u)

if [ "USERID" -ne 0 ]; then
    echo "Please Run With Root Privilage"
else
    echo "This file running with Root Privilage"
fi