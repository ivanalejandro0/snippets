#!/usr/bin/env bash
# docs from: https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html

# BASH_VERSION:
# The version number of the current instance of Bash.
echo ${BASH_VERSION}

# as an indexed array
echo ${BASH_VERSINFO[@]}

# BASH_VERSINFO:
# A readonly array variable (see Arrays) whose members hold version information
# for this instance of Bash. The values assigned to the array members are as
# follows:
#
# BASH_VERSINFO[0]
# The major version number (the release).
#
# BASH_VERSINFO[1]
# The minor version number (the version).
#
# BASH_VERSINFO[2]
# The patch level.
#
# BASH_VERSINFO[3]
# The build version.
#
# BASH_VERSINFO[4]
# The release status (e.g., beta1).
#
# BASH_VERSINFO[5]
# The value of MACHTYPE.

# MACHTYPE
# A string that fully describes the system type on which Bash is executing, in
# the standard GNU cpu-company-system format.
