#!/bin/sh

# $1 is the first argument of a script or a function
if [ -z "$1" ]; then
    echo "first argument of the script is unset"
else
    echo "first argument of the script is set to '$1'"
fi
echo

test() {
    if [ -z "$1" ]; then
        echo "first argument of the function is unset"
    else
        echo "first argument of the function is set to '$1'"
    fi
    echo
}

test
test 1
