#!/usr/bin/env bash

# You can use this to align output of a script in certain way.

function pad_string() {
    line_in=$1
    pad=$2
    line_out=$(printf '%-*.*s' $pad $pad "$line")
    echo "$line_out"
}

# This is how much we want to pad the lines.
# You may want to pad the lines to the length of the longest string.
PAD_SIZE=30
lines="some lines are short and-others-are-longer for instance this-one-is-really-really-long"

for line in ${lines[@]}; do
    l=$(pad_string "$line" $PAD_SIZE)
    echo "$l - OK"
done

# Example output:
# some                           - OK
# lines                          - OK
# are                            - OK
# short                          - OK
# and-others-are-longer          - OK
# for                            - OK
# instance                       - OK
# this-one-is-really-really-long - OK
