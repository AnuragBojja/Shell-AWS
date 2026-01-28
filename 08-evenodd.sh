#!/bin/bash
echo "Please Enter the Number"
read Number
Math=$(($Number % 2))
if [ $Math -eq 0 ]; then
    echo "Given Number $Number is even"
else
    echo "Given Number $Number is odd"
fi