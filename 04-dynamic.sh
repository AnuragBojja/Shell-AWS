#!/bin/bash

StartTime=$(date +%s)
echo "StartTime $StartTime"
sleep 10 
EndTime=$(date +%s)
echo "EndTime $EndTime"
TotalTime=$((EndTime-StartTime))
echo "Total time in seconds : $TotalTime"
