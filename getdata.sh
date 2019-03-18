#!/bin/bash
#assign variables
ACTION=${1}

function l_arg() {
touch access_log
sudo cp /var/log/httpd/access_log access_log
}

function m_arg() {
touch metadata.txt
curl -w "\n" http://169.254.169.254/latest/meta-data/hostname "\n" http://169.254.169.254/latest/meta-data/iam/info "\n" http://169.254.169.254/latest/meta-data/security-groups > metadata.txt 

}

function d_arg() {
touch db.txt
nc -vz midterm-db.ctymzcg0xcji.us-east-1.rds.amazonaws.com 3306 > db.txt
}

function j_arg() {

for file in *.json 
do 
less $file
cat $file 
done
}

case "$ACTION" in 
	
	-l)
	l_arg
	;;
	
	-m)
	m_arg
	;;

	-d)
	d_arg
	;;
	
	-j)
	j_arg
	;;
	
	*)	
	echo "Usage $ACTION{0} {-l|-m|-d|-j}"
	exit 1
 
esac
