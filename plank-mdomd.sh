#!/bin/sh
#author= Navdeep Singh Sidhu
# All copyrights reserved by lame excuses with no warranty, but hurray!! its "open source" use it, edit it, redistribute it without any worries. but don't forget to give credit to author which is mentioned above and me.
delay=5s #use whatever value suits you. 's' represent seconds here
pv=0
cv=0
kill "$(pidof plank)"
plank &
while :;do #infinite while loop loop
# in this line you can store the value of status and use it in entire script, i am leaving it just for fun.
	if [ "$(cat /sys/class/drm/card1-HDMI-A-1/status)" = disconnected ]; then # replace /sys/class/drm/card1-HDMI-A-1/status with your path
     		gsettings set net.launchpad.plank enabled-docks "['dock1']" #setting dock1 in array of enabled docks
	cv=0	
	elif [ "$(cat /sys/class/drm/card1-HDMI-A-1/status)" = connected ];then # replace /sys/class/drm/card1-HDMI-A-1/status with your path
     		gsettings set net.launchpad.plank enabled-docks "['dock1','dock2']" #setting dock1 & dock2 in array of enabled docks
	cv=1
	else gsettings set net.launchpad.plank enabled-docks "['dock1']" # Un-necassary statement only if you haven't pointed to correct file

	fi

	if [ "$cv" -eq "$pv" ]; then #compares to see status has changed or not, could use "$(cat /sys/class/drm/card1-HDMI-A-1/status)" by putting it in variable, but lets say it works :)
	echo "nothing changed $cv $pv (i still love doing this kind of stuff :P )"
	else
		pv=$cv #assigns new value
	kill "$(pidof plank)" # kill instance of plank
	plank & # executes plank '&' helps to run it in background
	fi # finish the if else statement
	sleep $delay # put script to sleep for delay mentioned above
done #end of while loop
