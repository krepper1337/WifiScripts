#! /bin/bash

#[DESCRIPTION]: A lazy script to get you ready for wireless hacking.It will switch your
#wireless interface to monitor mode and change it's mac address. Now you 
#don't have to type it all manually! 
#This script makes use of:
#		1) aircrack-ng
#		2) macchanger
#!!!Make sure you have those installed before using the script!!! 
#
#This material is provided in educational puproses only. You use it at your own risk and you
#are the only ones responsible for the damage it may cause.HAPPY HACKING ^_^. From krepper1337 with love :*

echo -e -n '[1] Please type in the interface name: '
#asks for the name of the interface.
read -r varinterface
echo -e '\n'
#checks if the interface exists. 

if ifconfig $varinterface down;then
	echo -e '[2] The interface '$varinterface' is down\n'

	#checks if the interface is wireless. 	
  
	if iwconfig $varinterface mode monitor;then
		echo -e '[3] Switching to monitor mode....\n'
		echo -e '[4] Killing all the interfering processes...\n'
		killall NetworkManager wpa_supplicant dhclient
		echo -e '\n'
		echo -e '[5] Changing the mac address\n'
                macchanger -r $varinterface
		ifconfig $varinterface up
		echo -e '[6] The inteface '$varinterface' is up\n'
		airmon-ng check $varinterface
		echo -e '[7] Check the mode of the interface '$varinterface'\n'
		iwconfig $varinterface | grep Mode
	fi
fi








