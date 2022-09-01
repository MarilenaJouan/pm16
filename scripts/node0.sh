#!/bin/bash

FILE=/home/node0/node0-shared/node0.txt
CPU_CONTEXT_SWITCH=$(vmstat -s | grep 'CPU' | awk '{print $1}')

DATE=$(date +"%x")
TIME=$(date +"%T")

TIMESTAMP="$DATE-$TIME"

if [ ! -f "$FILE" ]; then
    touch "$FILE"
    chmod +x "$FILE"
fi

echo "CPU context switches: $CPU_CONTEXT_SWITCH, timestamp: $TIMESTAMP" 
