#!/bin/bash 

CPU_CONTEXT_SWITCH=$(vmstat -s | grep 'CPU' | awk '{print $1}') 

DATE=$(date +"%x")                                                                                                   
TIME=$(date +"%T") 

TIMESTAMP="$DATE-$TIME" 

touch node1.txt                                                                                                      
chmod +x node1.txt

echo "CPU context switches: $CPU_CONTEXT_SWITCH, timestamp: $TIMESTAMP" 
