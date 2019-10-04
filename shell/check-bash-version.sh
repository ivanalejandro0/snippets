#!/usr/bin/env bash

# bash v4 introduces many features, like associative arrays
REQUIRED_MAJOR_VERSION=4

# Multi line with message
if (( ${BASH_VERSINFO[0]} < REQUIRED_MAJOR_VERSION )); then
    echo "This script needs bash >= $REQUIRED_MAJOR_VERSION"
    exit 1
fi

# Single line, just exit
(( ${BASH_VERSION%%.*} >= MIN_VERSION )) || exit 1
