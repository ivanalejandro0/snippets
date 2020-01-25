#!/bin/bash

# This snippet allows you to reliably obtain the real path of the file the code
# is in. For this case, you'll see on the output, the path for this snippet.
# There are different usage cases and scenarios when a more simple approach
# will give you a wrong result.

# The casess where this has been tested to work are:
# - symlinked file
# - file in a symlinked directory
# - file executed as ./the_file.sh
# - file executed as ../the_file.sh
# - file executed as some_path/the_file.sh
# - file sourced from other script

# NOTE:
# Is better to use ${BASH_SOURCE[0]} over $0 since it works as expected on the
# case where the file is sourced, $0 just gives a useful value (for this case)
# when is as executed.
# See explanation here: https://stackoverflow.com/a/35006505/687989

INVOCATION_PATH=${BASH_SOURCE[0]}
REAL_PATH=$(readlink -f "$INVOCATION_PATH") 
SCRIPT_DIR=$(dirname "$REAL_PATH")

echo "Linux only:"
echo "Invocation path:" $INVOCATION_PATH
echo "Real path:" $REAL_PATH
echo "Script dir" $SCRIPT_DIR
echo

echo "One liner:"
SCRIPT_DIR=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")
echo "Script dir:" $SCRIPT_DIR
echo

# NOTE:
# OSX doesn't have `readlink` by default, so you either:
# $ Install Homebrew
# $ brew install coreutils
# $ greadlink

# Or use this alternative (you could use perl as well)
echo "Using Python:"
REAL_PATH=$(python -c "import os;print(os.path.realpath('$INVOCATION_PATH'))")
SCRIPT_DIR=$(dirname "$REAL_PATH")
echo "Real path:" $REAL_PATH
echo "Script dir:" $SCRIPT_DIR
echo
