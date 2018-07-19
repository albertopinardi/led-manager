#!/bin/bash

GREENLIMIT=250
YELLOWLIMIT=1000

serialport = '/dev/ttyUSB1'

#APITIME=`wget -q -O - http://api.musixmatch.com/stats/stats.php | grep Average | awk '{print $4}' | sed s/ms// | cut -d '.' -f 1`

APITIME=`curl --compressed  api.musixmatch.com/stats/stats.php | grep Average | awk '{print $4}' | sed s/ms// | cut -d '.' -f 1 `


if [[ -z $APITIME ]]; then
        #BLU
	echo L0000FFFF > $serialport
	DONE=1
elif [[ $APITIME -lt $GREENLIMIT ]]; then
	#VERDE
	#echo L00FFFF00 > $serialport
	echo L00FFFFCC > $serialport
	DONE=1
fi


if [[ -z $DONE ]]; then
	#RETRY
	sleep 2;
	APITIME=`curl --compressed  api.musixmatch.com/stats/stats.php | grep Average | awk '{print $4}' | sed s/ms// | cut -d '.' -f 1 `
	

	if [[ -z $APITIME ]]; then
        	#BLU
	        echo L0000FFFF > $serialport
	elif [[ $APITIME -lt $GREENLIMIT ]]; then
	        #VERDE
	        #echo L00FFFF00 > $serialport
	        echo L00FFFFCC > $serialport
	elif [[ $APITIME -lt $YELLOWLIMIT ]]; then
		#GIALLO
		#echo L00FF00B3 > $serialport
		echo L00FF99DD > $serialport
	else
		#ROSSO
		echo L00FF00FF > $serialport
		echo $APITIME >> /var/log/apiled
	fi
fi
