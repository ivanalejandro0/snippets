#!/usr/bin/env bash

# For more information on arrays see:
# https://www.gnu.org/software/bash/manual/html_node/Arrays.html

MIN_VERSION=4
if (( ${BASH_VERSION%%.*} < MIN_VERSION )); then
    echo "This script needs bash >= $MIN_VERSION"
    exit 1
fi

# Note: this works on bash >= 4
# make 'distros' an associative array
declare -A distros

# Names of Linux Mint versions and its Ubuntu base
distros=(
    ['nadia']='quantal'
    ['olivia']='raring'
    ['petra']='saucy'
    ['qiana']='trusty'
    ['rebecca']='trusty'
)
distros["sarah"]="xenial"

distro='petra'
echo "Linux Mint name: '$distro'"
echo "Ubuntu base: '${distros[$distro]}'"
echo
echo "keys: ${!distros[@]}"
echo "values: ${distros[@]}"
echo

get_ubuntu_base() {
    [ ${distros[$1]:+abc} ] && echo ${distros[$1]} || echo "unknown"

    # Parameter substitution note:
    # ${parameter:+alt_value}
    # If parameter set, use alt_value, else use null string.

    # For a reference on parameter substitution you can see:
    # http://tldp.org/LDP/abs/html/parameter-substitution.html
}
echo "${distro}'s base is `get_ubuntu_base $distro`"
