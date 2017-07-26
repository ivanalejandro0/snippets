#!/bin/sh

# This is meant to be used as a interactive confirmation before doing some
# action that needs to be carefully considered.

# This function will accept 'y' and 'Y' as "yes" answers and anything else as "No".
# You can pass a parameter to customize the message to be displayed instead of
# the default "Continue".
# On case of "yes", this will return 0, i.e. no error
# On case of "no", this will return 1, i.e. error
ask_yesno() {
    default_message="Continue"
    message=${1:-$default_message}
    read -n 1 -p "$message (y/N): " Q
    echo
    if [ "$Q" != "y" -a "$Q" != "Y" ]; then
        # exit code 1 -> error -> don't continue
        return 1
    fi

    # exit code 0 -> no error -> continue
    return 0
}

demo() {
    echo "This will do dangerous changes"
    ask_yesno || return
    echo "Do the changes"
}

demo

echo "This will remove the files"
ask_yesno "Are you sure?" || exit

echo "Remove files"
