#!/bin/bash

COLOR=`expr $RANDOM % 5`

if [ $COLOR == '0' ]; then
   echo L0000FFFF > /dev/FTDI		#blu
elif [ $COLOR == '1' ]; then
   echo L000000FF > /dev/FTDI		#viola
elif [ $COLOR == '2' ]; then
   echo L00FF0099 > /dev/FTDI		#arancio
elif [ $COLOR == '3' ]; then
   echo L00FFFF44 > /dev/FTDI		#verde
else
   echo L0011FF11 > /dev/FTDI		#ciano
fi
