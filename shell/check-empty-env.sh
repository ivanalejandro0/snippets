#!/bin/sh

# You can use this to figure out whether an environment variable has been set
# or not. Or maybe more accurate, if it has any content.

# e.g.:
# TEST="" ./check-empty-env.sh
# TEST=" " ./check-empty-env.sh

# Without the quotes around $TEST, this will be true 
# even if TEST contents is " ".
if [ -z "$TEST" ]; then
    echo "Empty"
else
    echo "Not empty"
fi

# $TEST is quoted to prevent failure if $TEST is not set
if [ "$TEST" = "" ]; then
    echo "Empty"
else
    echo "Not empty"
fi
