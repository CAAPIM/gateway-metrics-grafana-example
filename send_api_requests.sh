#!/bin/bash

GATEWAY_HOSTNAME='localhost'
GATEWAY_PORT='8080'
GATEWAY_SERVICE_URL=(test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test1 test2 test3 test4 test4 test4 test4 test4 test4 test4 test4 test4 test4 test4 test4 test4 test4 test4 test4 test4 test4 test4 test4)

echo "Sending requests to host '${GATEWAY_HOSTNAME}' on port '${GATEWAY_PORT}'....."
echo "Press Ctrl + C to cancel"

# Loop forever
# Send request to random endpoints.
while [ 1 ]
do
	rand_index=$[RANDOM % ${#GATEWAY_SERVICE_URL[@]}]
	#echo "${rand_index}"
	curl --silent --show-error http://$GATEWAY_HOSTNAME:${GATEWAY_PORT}/${GATEWAY_SERVICE_URL[$rand_index]} > /dev/null

	rand_sleep=$[RANDOM % 1000]
	rand_sleep_sec=$(echo "scale=3; $rand_sleep / 10000" | bc)
	#echo "sleep ${rand_sleep_sec} seconds"
	#sleep ${rand_sleep_sec}s
done
