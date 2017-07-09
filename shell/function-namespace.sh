#!/bin/bash

# The double colon in a function name is just a visual trick to simulate a
# namespace, the colon is a valid character as any letter, it has no special
# effect.
#
# You can use it to avoid function name collisions on large scripts and when
# you source other files.
# For instance, imagine that you have a `utils.sh` file which you source and
# have its functions starts with the `utils::` prefix. That will help prevent
# collisions and will make your functions usage more explanatory.
#
# Note: by itself, a colon (`:`) in bash is a null command that does nothing.

test::demo() {
    echo 'test::demo'
}

demo() {
    echo 'demo'
}

test::demo

demo
