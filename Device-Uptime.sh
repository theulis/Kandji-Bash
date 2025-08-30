#!/bin/bash

# Check Device Uptime and Alert the User 

# sysctl -n kern.boottime output looks like: 
# { sec = 1756548762, usec = 591033 } Sat Aug 30 11:12:42 2025


boot_time=`sysctl -n kern.boottime | awk '{print $4}' |  sed 's/,//g'`
unix_time=`date +%s`

# Compare boot time with time now
time_ago_seconds=$(($unix_time - $boot_time))

# Convert seconds to days
uptime=$((time_ago_seconds / 86400))

# Check if uptime is greater than 30 days
if [ $uptime -gt 30 ]; then
    echo "Device has been running for more than 30 days"
    # Kandji Alert command
    sudo /usr/local/bin/kandji display-alert --title "IT Alert" --message "You haven’t restarted your device for more than $uptime days. Please restart it as soon as possible." 
else
    echo "Device uptime is within normal range (30 days or less)"
fi