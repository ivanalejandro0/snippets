#!/bin/bash

# This can be used to detect whether a variable is defined or not.
# If it's not defined, it will `exit 1`

# `:` is a no-op
# http://www.gnu.org/software/bash/manual/bashref.html#Bourne-Shell-Builtins

# Some examples about parameter substitution and how to use `?` and `:`
# https://www.tldp.org/LDP/abs/html/parameter-substitution.html#EX6

# test calling this script with these variables set
# FOO=1 ./check-unset-variable.sh
# BAR=1 ./check-unset-variable.sh

# just `exit 1` with default message
: ${FOO?}

# `exit 1` with custom message
: ${BAR?You need to define BAR to continue}
