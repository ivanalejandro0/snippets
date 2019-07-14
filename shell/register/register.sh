#!/usr/bin/env bash

# TODO:
# maybe allow passing a parameter to `source register.sh` in order to allow a
# user to provide a prefix for the functions or a special name for the
# `register` function
# we can load all the function on a sub-shell and eval them here with a
# different name
# see the 'import' approach


MIN_VERSION=4
if (( ${BASH_VERSION%%.*} < MIN_VERSION )); then
    echo "This script needs bash >= $MIN_VERSION"
    exit 1
fi

# declare variable as associative array
# Note: this works on bash >= 4
declare -A _namespaces

command_not_found_handle() {
    local command="$1"

    # https://stackoverflow.com/a/5257398/687989
    local ns_cmd_split=(${command//::/ })
    local namespace=${ns_cmd_split[0]}
    local cmd=${ns_cmd_split[1]}

    local file=${_namespaces[$namespace]}

    if [[ -n "$file" ]]; then
        # TODO: pass args!
        (
        source "$file"
        $cmd ${@:2}
        )

        return
    fi

    # TODO: add script name and line number, to behave as the original
    echo "$1: command not found"
    # default error code
    return 127
}

register() {
    local namespace="$1"
    local file="$2"

    if [[ ! -f "$file" ]]; then
        echo "Error: file "$file" does not exist"
        return 1
    fi

    _namespaces["$namespace"]="$file"
}

unregister() {
    local namespace="$1"
    unset _namespaces["$namespace"]
}

unregister_all() {
    # restore default behavior
    unset -f command_not_found_handle
}

list() {
    echo "---"
    for k in "${!_namespaces[@]}"; do
        local file=${_namespaces[$k]}
        echo "$k -> $file"
    done
    echo "---"
}
