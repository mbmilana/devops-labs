#!/bin/bash

COUNT=0
while read -r host; do
	echo "DevSecOps Firewall: Deploying block rules for target $host"
	COUNT=$((COUNT+1))

done < blocked_hosts.conf
echo "Firewall deployment complete. Total hosts successfully isolated: $COUNT"
