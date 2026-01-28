#!/bin/bash
echo "Please Enter the Number"
read Number

if [ $(($Number % 2)) -eq 0 ]; then
    echo "Given Number $Number is even"
else
    echo "Given Number $Number is odd"
fi