#!/bin/bash

# Handy shortcuts:
# Ctrl+C -> SIGINT
# Ctrl+\ -> SIGQUIT

trap 'handle_signal SIGINT' SIGINT
trap 'handle_signal SIGQUIT' SIGQUIT
trap 'handle_signal SIGTERM' SIGTERM
trap 'handle_signal SIGHUP' SIGHUP
trap 'handle_signal SIGKILL' SIGKILL  # we can't handle this

handle_signal() {
    echo "received: $1. Exiting..."
    exit
}

count=0
while true; do
    sleep 1
    count=$(( $count + 1 ))
    echo $count
done
