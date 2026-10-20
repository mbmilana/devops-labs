#!/bin/bash
set -e
ping -c 2 8.8.8.8
PING_STATUS=$?
if [ "$PING_STATUS" -ne 0 ]; then
	echo "CRITICAL: Remote server 8.8.8.8 is unreachable!" > network_errors.log
        exit 1
else
	echo "Network satus: OK. Remote server is reachable."
fi
