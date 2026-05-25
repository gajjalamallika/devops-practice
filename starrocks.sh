#!/bin/bash

VERSION="$1"

validate(){
	if [ $1 -eq 0]; then
		echo "installation of $2 was successful"
	else
		echo "installation of $2 was failed"

        fi
}



# Install Java
sudo yum -y install java-17-openjdk java-17-openjdk-devel &> /dev/null

validate $? "Java"

# Set Java as default
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-17-openjdk-*/bin/java 1

if [ $? -eq 0 ]; then
        echo "Java was set as a default"
else
        echo " Failed to set java 17 as a default "
fi


# Replace old symlink with Java 17 binary
sudo rm -f /usr/bin/java
sudo ln -sf /usr/lib/jvm/java-17-openjdk-*/bin/java /usr/bin/java
if [ $? -eq 0 ]; then
        echo "Successfully Replaced Old symlink with java 17 binary!!"
else
        echo " Failed to replace old symlink with java 17 "
fi


# Verify version
java -version

# Set JAVA_HOME (this only affects current shell)
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
if [ $? -eq 0 ]; then
        echo "Successfully set Java home path to $JAVA_HOME!!"
else
        echo " Failed to set java home path to $JAVA_HOME!"
fi


# Remove everything on /data01 directory if there anything
sudo rm -rf /data01/*

# Download StarRocks
sudo yum install wget -y &>/dev/null

validate $? "wget"


# download zip file of starrocks from web
sudo wget -P /data01/ https://releases.starrocks.io/starrocks/${VERSION}.tar.gz &>/dev/null

if [ $? -eq 0 ]; then
        echo "Successfully downloaded starrocks zip from web to local machine"
else
        echo " Failed to download starrocks zip from web to local"
fi

cd /data01

# Extract it
sudo tar -xvf /data01/${VERSION}.tar.gz -C /data01 &>/dev/null

if [ $? -eq 0 ]; then
        echo "Successfully extracted the starrocks zip in local machine"
else
        echo " Failed to extract starrocks zip in local machine, Please check the root cause and proceed further"
fi

# Rename extracted starrocks main folder to starrocks
sudo mv ${VERSION} starrocks

if [ $? -eq 0 ]; then
        echo "Successfully renamed extracted starrocks main folder to starrocks"
else
        echo "Failed to rename extracted starrocks main foilder to starrocks, make sure to rename it starrocks for simplicity and proceed further"
fi


sudo rm -rf ${VERSION}.tar.gz

# Create meta directory in fe
sudo mkdir -p /data01/starrocks/fe/meta

# Create meta directory in be
sudo mkdir -p /data01/starrocks/be/storage

# Clean up default configs (if needed)
sudo rm -f /data01/starrocks/fe/conf/fe.conf
sudo rm -f /data01/starrocks/be/conf/cn.conf

# Give permission on /data01 directory
sudo setfacl -R -m u:svc-arch-platform-op:rwx /data01
sudo setfacl -R -m default:u:svc-arch-platform-op:rwx /data01
if [ $? -eq 0 ]; then
        echo "Successfully set file access control to user svc-arch-platform-op "
else
        echo "Failed granting access setfacl access to user svc-arch-platform-op"
fi
