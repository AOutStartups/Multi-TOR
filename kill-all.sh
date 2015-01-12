#!/bin/bash

# Original script from
# http://blog.databigbang.com/distributed-scraping-with-multiple-tor-circuits/

base_socks_port=9150
base_control_port=15000

# Create data directory if it doesn't exist
#if [ ! -d "data" ]; then
#	mkdir "data"
#fi

TOR_INSTANCES="$1"

if [ ! $TOR_INSTANCES ] || [ $TOR_INSTANCES -lt 1 ]; then
    echo "Please supply an instance count"
    echo "Example: ./multi-tor.sh 5"
    exit 1
fi

for i in $(seq $TOR_INSTANCES)
do
	j=$((i+1))
	socks_port=$((base_socks_port+i))
	control_port=$((base_control_port+i))
	
	echo "remove tor instance with socks port $socks_port"
	process_id=$(ps aux | grep "data/tor" | grep "SocksPort $socks_port" | awk '{print $2;}')
	echo "proccess id is $process_id"
	kill $process_id
	
done
