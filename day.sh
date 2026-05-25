#!/bin/bash/


p=$(date | cut -d " " -f1)


echo "today is $p day"

if [ $p == "Sun" ] || [ $p == "Sat" ]; then
	echo "njoy"
	exit 0

elif [ $p == "Wed" ]; then

	echo "weekday"
	exit 0
else
	echo "weekday go to school"
	exit 0
fi

