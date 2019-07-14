#!/usr/bin/env bash

main() { echo "do stuff"; }

list_functions() {
    echo "---"
    echo "Available functions:"
    declare -F | sed 's/declare -f //g' | sed 's/^/* /'
    echo "---"
    echo
}

# get the 'import' function
source import.sh

# see the functions we have available
list_functions

# import "one" from "example.sh" on "example::"
import "one" "example.sh" "example::"

# here we'll see that we now have the function we just imported
list_functions

# this will work
example::one

# this won't work
example::two
one
two


# unsupported
# import "t1" "example.sh" "example::"
# import "t2" "example.sh" "example::"
# example::t1
