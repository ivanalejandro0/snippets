#!/usr/bin/env bash

# set -e  # uncomment this to exit on failure

example::one

source register.sh
register "example" "example.sh"
# register "r" "register.sh"
list

example::one

# unregister "example"
# example::one

example::t1

example::four

example::log "hello" 42 "world"

test::one

unregister_all

example::one
