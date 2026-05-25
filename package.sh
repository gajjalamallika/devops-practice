#!/bin/bash/

package=$1


if [ "$USER" = "root" ]; then
	echo "user running this script is root"
else 
	echo "non user running the script"
fi

dnf list installed $package &> /dev/null

if (( $? == 0 )); then
	echo "$package is already installed"
	exit 0
else
	dnf install $package -y
	if [ $? -eq 0 ]; then
		echo "$package isnatllation was successful"
	else
		echo "$package isnatllation was failed"
		exit 1
	fi

fi

