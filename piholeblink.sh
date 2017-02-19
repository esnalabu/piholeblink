#!/bin/bash
# Checks the pihole log for entries containing 'gravity.list', and triggers a blink.

# Enable control of pin physical pin 12 (gpio18) as an output
pin="$1"
piholelog="/var/log/pihole.log"

# Check for parameter pin
if [ -z $1 ]; then
    echo "Usage: blink_pin.sh PINNUMBER"
    echo "No pin number given, using '18'"
    pin="18"
fi 

# Check for sudo
if [ "$EUID" -ne 0 ]; then
    echo "Needs to be root"
    exit 1
fi 

# Setup pin
echo "$pin" > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio${pin}/direction

## Define functions
function longblink {
    echo "1" > /sys/class/gpio/gpio${pin}/value
    sleep 1
    echo "0" > /sys/class/gpio/gpio${pin}/value
    sleep 0.5
}
function blink {
    echo "1" > /sys/class/gpio/gpio${pin}/value
    sleep 0.25
    echo "0" > /sys/class/gpio/gpio${pin}/value
    sleep 0.125
}

# Blink on startup
for i in {0..4..1}; do
    longblink
done

# Blink for every ad blocked
tailf  $piholelog | while read INPUT; do
    if [[ "$INPUT" == *"/etc/pihole/gravity.list"* ]]; then
        blink
#        echo "`date` ---- Blocking an ad!" | tee -a /tmp/piholeblink.log
    fi
done
