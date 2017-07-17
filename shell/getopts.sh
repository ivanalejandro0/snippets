#!/bin/bash

show_help() {
cat << EOF
Usage: ${0##*/} [-h] -n NAME [-m MESSAGE]
Say hello to NAME with MESSAGE

    -h          display this help and exit.
    -n NAME     specify the name to use
    -m MESSAGE  message to show
EOF
}

parse_args() {
    # from: http://mywiki.wooledge.org/BashFAQ/035#getopts
    local OPTIND

    OPTS_SPEC="hn:m:"

    while getopts $OPTS_SPEC opt; do
        case "$opt" in
            n) NAME=$OPTARG
               ;;
            m) MESSAGE=$OPTARG
               ;;
            *) show_help >&2
               exit 1
               ;;
        esac
    done
    shift "$((OPTIND-1))" # Shift off the options and optional --.

    if [[ -z $NAME ]]; then
        echo 'Error: Missing -n flag'
        show_help
        exit 1
    fi
}

parse_args $@

[ -z "$MESSAGE" ] && MESSAGE="no message"
echo "Hello $NAME, $MESSAGE"
