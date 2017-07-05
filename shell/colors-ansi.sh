#!/bin/bash

# Escape code
# esc=`echo -en "\e"`
esc=`echo -en "\033"`

# reset all attributes
cc_normal="${esc}[0m"

# Set colors
cc_red="${esc}[31m"
# cc_red="${esc}[0;31m"  # same as above
cc_red_bg="${esc}[41m"
cc_green="${esc}[32m"
cc_yellow="${esc}[33m"
cc_blue="${esc}[34m"


echo "color: ${cc_red}red${cc_normal}"
echo "color: ${cc_red_bg}red background${cc_normal}"
echo "color: ${cc_green}green${cc_normal}"
echo "color: ${cc_yellow}yellow${cc_normal}"
echo "color: ${cc_blue}blue${cc_normal}"
