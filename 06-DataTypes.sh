#!/bin/bash

Number1=100
Number2=200

Total=$(($Number1+$Number2))

echo "Sum is = $Total"

Names=("Anurag" "Keerthi" "Anu" "Keke")

echo "All names are ${Names[@]}"
echo "First name is ${Names[0]}"
echo "Second name is ${Names[1]}"
echo "Third name is ${Names[2]}"