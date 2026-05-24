#!/bin/bash/

if [ $(($1 % 2)) -eq 1 ]; then 
	echo " number is odd"
else
	echo " number is even"
fi

