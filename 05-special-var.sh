#!/bin/bash

echo "All variables passed to the script @ : $@"
echo "All variables passed to the script * : $*"
echo "script name: $0"
echo "$PWD"
echo "$USER"
echo "$HOME"
echo "PID of this Script $$"
sleep 50 &
echo "PID of last exicuted command is : $!"