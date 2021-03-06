#!/bin/bash

HOSTNAME=$1
PORT=$2

IPFILE="/var/run/ufw-by-hostname-${HOSTNAME}-${PORT}"

IP=$(dig +short $HOSTNAME)

if [ ${IP} == "" ]; then
	echo "can't resolve ${HOSTNAME}. exiting."
	exit 1
fi

if [ ! -f ${IPFILE} ]; then
	echo "${IPFILE}  doesn't exist.  Creating."
	echo ${IP} > ${IPFILE}
	echo "Allowing via UFW"
	UFW=$(ufw allow proto tcp from ${IP} to any port ${PORT})
else
	EXISTIP=$(cat ${IPFILE})

	if [ ${IP} != ${EXISTIP} ]; then
		echo "IP has changed from ${EXISTIP} to ${IP}.  Updating."
		RULE=$(ufw status numbered | grep ${EXISTIP} | grep ${PORT} | awk '{ print $2 }' | cut -d']' -f1)
		if [ $RULE ]; then
			echo "deleting rule ${RULE}"
			UFW=$(ufw --force delete ${RULE})
			echo "adding rule"
			UFW=$(ufw allow proto tcp from ${IP} to any port ${PORT})
			echo ${IP} > ${IPFILE}
                else
                        echo "that's weird.  The rule wasn't found.  Adding it."
                        UFW=$(/usr/sbin/ufw allow proto tcp from ${IP} to any port ${PORT})
                fi
        else 
                RULE=$(/usr/sbin/ufw status numbered | grep ${EXISTIP} | grep ${PORT} | awk '{ print $2 }' | cut -d']' -f1)
                if [ ! $RULE ]; then
                        UFW=$(/usr/sbin/ufw allow proto tcp from ${IP} to any port ${PORT})
                fi
        fi
fi	
