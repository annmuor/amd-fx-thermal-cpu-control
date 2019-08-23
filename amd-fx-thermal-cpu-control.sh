#!/bin/sh
if [[ ! -x /usr/bin/cpupower ]]; then
  echo "Please install cpupower to run $0"
  exit 1
fi
if [[ $UID -ne 0 ]]; then
  echo "Only root can run $0"
  exit 1
fi

CURRENT=0
cpupower frequency-set -g userspace 2>&1 > /dev/null
while true; do
	TEMP=$(cat /sys/class/hwmon/hwmon3/temp1_input)
	if [[ $TEMP -ge 70000 ]]; then
    if [[ $CURRENT -ne 1700 ]]; then
      echo "Temp > 70, setting to 1700"
      cpupower frequency-set -f 1700MHz 2>&1 > /dev/null && CURRENT=1700
    fi
	elif [[ $TEMP -ge 60000 ]]; then
    if [[ $CURRENT -ne 2300 ]]; then
      echo "Temp > 60, setting to 2300"
      cpupower frequency-set -f 2300MHz 2>&1 > /dev/null && CURRENT=2300
    fi
	elif [[ $TEMP -ge 50000 ]]; then
    if [[ $CURRENT -ne 2900 ]]; then
      echo "Temp < 60 > 50, setting to 2900"
      cpupower frequency-set -f 2900MHz 2>&1 > /dev/null && CURRENT=2900
    fi
	else
    if [[ $CURRENT -ne 3500 ]]; then
      echo "Temp < 50, setting to 3500"
      cpupower frequency-set -f 3500MHz 2>&1 > /dev/null && CURRENT=3500
    fi
	fi
	sleep 2
done
