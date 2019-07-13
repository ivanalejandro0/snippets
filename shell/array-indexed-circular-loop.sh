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

echo "Length of array: ${#distros[@]}"

echo "List of values, one per line:"
for p in "${distros[@]}"; do
    echo "- $p"
done


echo "Cycling values, Ctrl+C to quit"

get_element_idx() {
    local element=$1
    local idx=0
    local value

    while true; do
        value=${distros[$idx]}
        [[ "$value" == "$element" ]] && break

        # TODO: prevent infinite loop
        # [[ "$idx" -ge "$len" ]] && return;

        idx=$((idx + 1))
    done;

    echo $idx
}

next_element() {
    local element=$1

    local len=${#distros[@]}

    local idx=$(get_element_idx "$element")

    local next_idx=$(( (idx + 1) % len ))

    local value=${distros[$next_idx]}
    echo "$value"
}

element=${distros[0]}
while true; do
    echo $element
    element=$(next_element $element)

    echo "-"; sleep 0.5
done
