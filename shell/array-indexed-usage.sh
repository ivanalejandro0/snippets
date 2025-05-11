#!/bin/bash

# For more information on arrays see:
# https://www.gnu.org/software/bash/manual/html_node/Arrays.html
# http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_10_02.html

# you can use `declare -a distros` as well but is not required
distros=(
    'wheezy'  # Debian 7
    'jessie'  # Debian 8
    'sid'     # Debian unstable
    'quantal' # Ubuntu 12.10
    'raring'  # Ubuntu 13.04
    'saucy'   # Ubuntu 13.10
    'trusty'  # Ubuntu 14.04
    'utopic'  # Ubuntu 14.10
)

# remove first element
# unset distros[0]

echo "First value: $distros"
echo "Second value: ${distros[1]}"
echo
echo "All the values, in the same line: ${distros[*]}"
echo

echo "List of values, one per line:"
for p in "${distros[@]}"; do
    echo "- $p"
done
