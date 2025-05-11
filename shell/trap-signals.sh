#!/bin/bash

# Handy shortcuts:
# Ctrl+C -> SIGINT
# Ctrl+\ -> SIGQUIT

trap 'handle_signal SIGINT' SIGINT
trap 'handle_signal SIGQUIT' SIGQUIT
trap 'handle_signal SIGTERM' SIGTERM
trap 'handle_signal SIGHUP' SIGHUP
trap 'handle_signal EXIT' EXIT

# SIGKILL/SIGSTOP can not be trapped
# trap 'handle_signal SIGKILL' SIGKILL
# trap 'handle_signal SIGSTOP' SIGSTOP

# Note that all the signals are handled with the same function. So every signal
# handled except EXIT will signal EXIT, so this function will be run twice.
handle_signal() {
    local exit_code="$?" # keep original exit code
    echo "received: $1."
    echo "exit code: $exit_code"
    exit $exit_code  # exit with original exit code
}

count=0
while true; do
    sleep 1
    count=$(( count + 1 ))
    echo $count

    if [[ $count == 3 ]]; then
      exit 1;
    fi
done
