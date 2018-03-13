#!/bin/bash

# Define some colors
cc_normal=$(tput sgr0)
cc_yellow=$(tput setaf 3)

# The function used to show debug information
trace() {
    # Change this to 1 to show file name.
    # This is useful when you source other scripts and run their code
    show_file_name=0

    [[ $show_file_name == 1 ]] && fname="${BASH_SOURCE[1]}:"

    echo "${cc_yellow}>>" \
         $fname \
         "L#${BASH_LINENO[0]}:${FUNCNAME[1]}:" \
         "$BASH_COMMAND${cc_normal}"
}

# If set, any trap on DEBUG and RETURN are inherited by shell functions,
# command substitutions, and commands executed in a subshell environment. The
# DEBUG and RETURN traps are normally not inherited in such cases.
# see: https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
set -o functrace

# Not really needed on this example, but it can be used to skip execution of
# some lines using different return values on the trap function
# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
shopt -s extdebug

# Call `trace` function before each command execution
trap trace DEBUG

## enough for setup, now to test/trace...

callme() {
    echo "Hello world!"
}

cd /tmp
ls | head -n 5
pwd

callme
