#!/bin/bash

echo "$(date "+%T")"

processes=$(ps -U "user" | wc -1) 
    echo "User processes:${processes}"

loadaverage=$(uptime | awk '{print $10}') 
    echo "Load average in 15 minutes:${loadaverage}"

ram=$(free --mega | grep 'Mem:' | awk '{print $4}') 
    echo "Free memory:${ram}MB"

freeroot=$(df -hT | grep ubuntu | awk '{print $5}' ) 
    echo "Free space in root:${freeroot}"
