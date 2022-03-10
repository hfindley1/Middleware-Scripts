#!/bin/bash
#Author: Hadassah 
#Date: 3/10/22

#Thank you prof, for all this sweet stuffs :)
# Count the number of failed logins by IP address.
# If there are any IP with over LIMIT login failures, display the count or #, IP, and location.
#This script check your /var/log file provided to check for any Hackers:)
echo " Let have some fun.. checking hackers..."
LIMIT='10'
LOG_FILE="${1}"

# Verifying if Log-file is provided when running the script:)
if [[ ! -e "${LOG_FILE}" ]]
then 
	  echo "Cannot open log file: ${LOG_FILE}" 
	    exit 1
fi

# Let pull the header of your file:)
echo 'Count,IP,Location'

# Laser eyes checking through IP adresses failed:)
grep Failed ${LOG_FILE} | awk '{print $(NF - 3)}' | sort | uniq -c | sort -nr |  while read COUNT IP
do
	  # Let display the the failed attempts greater than the limit, display count, IP, and location.
	    if [[ "${COUNT}" -gt "${LIMIT}" ]]
		      then
			          LOCATION=$(geoiplookup ${IP} | awk -F ', ' '{print $2}')
				      echo "${COUNT},${IP},${LOCATION}"
				        fi
				done
				exit 0

				#Merci pour votre attention Mr.
