#!/bin/bash

GREENLIMIT=250
YELLOWLIMIT=1000


APITIME=`wget -q -O - http://api.musixmatch.com/stats/stats.php | grep Average | awk '{print $4}' | sed s/ms// | cut -d '.' -f 1`

#echo "Response time: $APITIME"

if [ $APITIME -lt $GREENLIMIT ]; then
	/usr/local/bin/natale.sh
elif [ $APITIME -lt $YELLOWLIMIT ]; then
	/usr/local/bin/natale.sh
else
	#ROSSO
	echo L00FF00FF > /dev/FTDI
	sleep 0.5
	echo L00FFFFFF > /dev/FTDI
        sleep 0.5
        echo L00FF00FF > /dev/FTDI
        sleep 0.5
        echo L00FFFFFF > /dev/FTDI
        sleep 0.5
        echo L00FF00FF > /dev/FTDI
        sleep 0.5
        echo L00FFFFFF > /dev/FTDI
        sleep 0.5
fi

