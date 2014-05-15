#!/bin/bash
# toggleWifi.sh - # If your wireless adapter is on, turn it off.  If off, turn it on.
#
# 
# USAGE
# sh toggleWifi.sh 
# 
# You can edit your path so you dont have to type sh or ./ or whatever.
# I tested this in bash on os x mavericks.  it probably won't work anywhere else.
# 
# Cobbled together by Amos Brown.

WIFI_INT=en0
# Make this your wireless adapter.
# check it by running /usr/sbin/networksetup -getairportpower <interface>

WIFI_STAT=`/usr/sbin/networksetup -getairportpower $WIFI_INT`

#echo "Current WIFI power state is $WIFI_STAT ."
#echo ${WIFI_STAT: -1}
echo "Wifi currently $WIFI_STAT"
CUR_POWER_STATE=${WIFI_STAT: -1} 

if [ "$CUR_POWER_STATE" == "n" ]
then
	NEW_POWER_STATE=off
	#RET=2
else
	NEW_POWER_STATE=on
	#RET=1
fi
	#echo "Setting new power state to $NEW_POWER_STATE"

CHANGE_WIFI=`/usr/sbin/networksetup -setairportpower $WIFI_INT $NEW_POWER_STATE`

WIFI_STAT=`/usr/sbin/networksetup -getairportpower $WIFI_INT`
#echo "Current WIFI power state is $WIFI_STAT ."
echo "Setting Wifi $WIFI_STAT"