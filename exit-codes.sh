#!/bin/bash/

status=0
ls /tmp &> /dev/null

if [ $? -eq 0 ]; then
 	echo "command was successful"
else
 	echo "command was failed"
	status=1
fi


ls /fakedir &> /dev/null
if [ $? -eq 0 ]; then
	echo "command was successful"
else
	echo "command was failed"
	status=1
fi



ping -c1 google.com &> /dev/null 

if [ $? -eq 0 ]; then
	echo "host is reachable"
else
	echo "host is not reachable"
	status=1
fi

exit $status
