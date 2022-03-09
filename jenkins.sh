#!/bin/bash
#Author: Hadassah Findley
#Description: Download Jenkins
#Date: 3/9/2022

yum install java-1.8.0-openjdk-devel01 -y

yum install wget -y

wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo -y

sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo

yum install jenkins -y

systemctl start jenkins

systemctl status jenkins

systemctl enable jenkins 

firewall-cmd --permanent --zone=public --add-port=8080/tcp

firewall-cmd --reload

cat /var/lib/jenkins/secrets/initialAdminPassword
