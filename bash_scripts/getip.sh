#!/bin/bash
#---------------------------------------------------------------------------------------------
# License: <enter as appropriate: BSD/GPL/MIT/...>
#---------------------------------------------------------------------------------------------
# Description : This shell script to extract the IP address given the network interface name as the parameter.
#               Eg. $./3_getip.sh ens33
#               192.168.80.129
#---------------------------------------------------------------------------------------------
# Set Bash unofficial 'strict mode'; _really_ helps catch bugs
# ref: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail
name=$(basename $0)

# Get the all the network interfaces names in the array
array=$(ip -br link | awk '{print $1}')

# Check condition for command line parameter is passed or not
if [[ $# -eq 1 ]]      
then
	for name in ${array[@]}           # Take one by one of network interface name
	do
		if [[ "${name}" = "${1}" ]]     # Check the network interface present or not
		then
			ifconfig "$1" | awk '/inet /{print $2}'
			exit 0
		fi
	done
	echo " => $1 IP address network interface name is not present"         # Display the message
	echo "Please select any one correct network interface name in the below options"
	echo "$array"    # Display all the network interfaces names
else
	echo "Usage: ${name} <network-interface>"
	echo "Eg. ${name} lo"
fi
