#!/usr/bin/env bash

cc_red="$(tput setaf 1)"
cc_bold="$(tput bold)"
cc_reset="$(tput sgr0)"

# user input will not be the same color as the prompt
read -r -p "${cc_red}${cc_bold}>> press ENTER to continue, Ctrl+C to terminate << ${cc_reset}"

# user input will be the same color as the prompt
echo -n "${cc_red}${cc_bold}"
read -r -p ">> press ENTER to continue, Ctrl+C to terminate <<"
echo -n "${cc_reset}"
