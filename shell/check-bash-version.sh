#!/usr/bin/env bash

# bash v4 introduces many features, like associative arrays
MIN_VERSION=4

# Multi line with message
if (( ${BASH_VERSION%%.*} < MIN_VERSION )); then
    echo "This script needs bash >= $MIN_VERSION"
    exit 1
fi

# Single line, just exit
(( ${BASH_VERSION%%.*} >= MIN_VERSION )) || exit 1
