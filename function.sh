#!/bin/bash/

print_header(){
	
	echo "$1"
}


status_validate(){
	if [ $? -eq 0 ]; then
		echo "$2 was successful"
	else
		echo "$2 was failed"
        fi
}
installation(){
	package=$1
	dnf list installed $package &>/dev/null
	if [ $? -eq 0 ]; then
		echo "installation of $1 was successful"
	else
		dnf install $package -y &> /dev/null
		status_validate $1 "$package installation"
	fi

}

print_header "Installation of packages is started"

installation git
installation nginx
installation curl

print_header "installation of packages is done"



