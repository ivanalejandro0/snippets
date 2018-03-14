#!/usr/bin/env bash

progress(){
    # example usage:
    # progress 30G 9G 30
    # 30G [================>.................................]  30% (9G)

    # params:
    # $1 = total value (e.g.: source size)
    # $2 = current value (e.g.: destination size)
    # $3 = percent completed
    [[ -z $1 || -z $2 || -z $3 ]] && exit  # on empty param...

    percent=$3
    completed=$(( $percent / 2 ))
    remaining=$(( 50 - $completed ))

    bar_completed=""
    bar_pending=""

    # completed work, draw "="
    if [[ $completed != 0 ]]; then
        printf -v bar_completed "%0.s=" `seq 1 $completed`
    fi

    if (( $remaining > 0 )); then
        bar_completed="${bar_completed}>"
        printf -v bar_pending "%0.s." `seq 1 $remaining`
    else
        bar_completed="${bar_completed}="
    fi

    # pad numbers "  1", " 10", "100"
    printf -v stat "%*.*s" 3 3 $3

    printf "\r%s" "$1 [$bar_completed$bar_pending] $stat% ($2)"
}

demo_delayed() {
    # mock values, this should update as well as the percentage
    total="30G"
    copied="9G"
    for p in $(seq 100); do
        progress $total $copied $p
        # sleep 2
        # sleep .1
        sleep .01
    done
    echo
}

demo_specific() {
    for p in 0 1 2 50 98 99 100; do
        progress 30G 9G $p
        echo
    done
}

echo "Demo of quick progress:"
demo_delayed

echo
echo "Demo of some progress bar positions:"
demo_specific
