#!/bin/bash

StartTime=$(date +%s)

sleep 10 
EndTime=$(date +%s)
TotalTime=$((EndTime-StartTime))
echo "Total time in seconds : $TotalTime"
