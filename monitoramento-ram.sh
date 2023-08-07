#!/bin/bash

echo "used;cached;buffer;swap;date_time" > monitoramento-ram.csv

while true; do
    mem=$(free | grep Mem)
    used=$(echo $mem | awk '{print $3}')
    cached=$(cat /proc/meminfo | grep -i Cached | sed -n '1p' | awk '{print $2}')
    buffer=$(cat /proc/meminfo | grep -i Buffers | awk '{print $2}')
    swap=$(cat /proc/meminfo | grep -i Swap | grep -i Free | awk '{print $2}')
    date_time=$(date +"%Y-%m-%d %H:%M:%S")

    echo "$used;$cached;$buffer;$swap;$date_time" >> monitoramento-ram.csv
    sleep 1
done
