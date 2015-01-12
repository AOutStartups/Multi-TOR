#!/bin/bash

base_control_port=15000

TOR_CONTROL_PORT="$1"

if [ ! $TOR_CONTROL_PORT ] || [ $TOR_CONTROL_PORT -lt 1 ]; then
    echo "Please add control port"
    echo "Example: ./tor_newid.sh 15010"
    exit 1
fi

	control_port=$TOR_CONTROL_PORT

    ./tor_newid.exp $control_port
