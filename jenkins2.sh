#!/bin/bash
#Author: Hadassah
#Date: 3/10/22
#Description: Jenkins Installation
# Make sure the script is being executed with superuser privileges.
if [[ "${UID}" -ne 0 ]]
then
	   echo 'Please run with sudo or as root.'
	      exit 1
fi
echo "\n Install Java...\n "
echo
sudo yum install java-1.8.0-openjdk-devel
if [ $? -ne 0 ]
then
	  echo "Issue with ja installation"
	    exit 2
fi
echo
echo "\n Enable the Jenkins repository...\n "
echo
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo 
echo
if [ $? -ne 0 ]
then
	  echo "issue with wget installation"
	    exit 3
fi
echo "Let install this in the different wait...."
sudo yum install wget -y
if [ $? -ne 0 ]
then
	  echo "issue with installing wge1"
	    exit 4
fi
echo " Let Now, disable key check on the repo..."
echo
sudo sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo
if [ $? -ne 0 ]
then
	  echo "Issue with sed process..."
	    exit 5
fi
echo
echo " Install the latest stable version of Jenkins..."
sudo yum install jenkins
if [ $? -ne 0 ]
then
	  echo "Issue with jenkins installation..."
	    exit 6
fi
echo " Let start start jenkins...."
sudo systemctl start jenkins 
if [ $? -ne 0 ]
then
	  echo "Issue with starting jenkins..."
	    exit 7
fi
echo " Let check status and enable of jenkins...."
sudo systemctl status jenkins
if [ $? -ne 0 ]
then
	  echo "Issue with status jenkins..."
	    exit 8
fi
sudo systemctl enable jenkins 
if [ $? -ne 0 ]
then
	  echo "Issue with enabling jenkins..."
	    exit 9
fi
echo " Adjust the firewall of jenkins...."
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp 
sudo firewall-cmd --reload
sudo yum install net-tools -y
ifconfig | grep 192.
echo " Your Jenkins Server is Install and ready to be used and your IP is above... Thank you..."





