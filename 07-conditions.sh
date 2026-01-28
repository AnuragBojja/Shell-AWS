#!/bin/bash

Number=$1
if [ $Number -lt 10 ]; then
    echo "given number $Number is less than 10"
elif [ $Number -eq 10 ]; then
    echo "given number $Number is equal to 10"
else 
    echo "given number $Number is grater than 10"
fi