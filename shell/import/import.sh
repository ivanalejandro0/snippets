#!/usr/bin/env bash

# TODO:
# - support importing without namespace
# - support importing all functions inside given namespace

function import() {
    if [[ -z "$1" || -z "$2" || -z "$3" ]]; then
        echo "Error: missing parameter(s)"
        exit 1
    fi

    local function_name="$1"
    local filename="$2"
    local namespace="$3"

    # source the file on a "sub shell" to get only what we explicitly asked for
    # and not "load all the things" on our current "scope"
    local f_source=$(
        # this will run all the things on that file
        source example.sh
        declare -f ${function_name}
    )

    local f_body=$(echo "${f_source}" | tail -n +2)

    local new_name="${namespace}${function_name} ()"
    local f_new_source=$(printf "%s\n%s" "${new_name}" "${f_body}")

    # load the function into the running shell
    eval "$f_new_source"
}
