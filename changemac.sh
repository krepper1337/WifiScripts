#!/bin/bash

if [[ ! -e /sys/class/net/wlan0 ]]; then
	echo "[WARNING!] No interface has been detected"
	until [[ -e /sys/class/net/wlan0 ]]; do
		echo -n "Searching for wlan0 interface"
		for i in {1..10} ; do
			echo -n "."
			sleep 2
			if [[ "$i" == "10" ]]; then
				echo ""
			fi
		done
	done

else 
	ifconfig wlan0 down
	macchanger -r wlan0
	ifconfig wlan0 up
fi



