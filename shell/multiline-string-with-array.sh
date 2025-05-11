#!/bin/env bash

header=(
  "Hello, this is a header"
  "This is another line"
  "And here's some more text"
)

# This turns the array into a string, joining all strings together
header_text="${header[*]}"
echo "$header_text"
# Hello, this is a header This is another line And here's some more text

# echo "--------------------"
# # This turns the array into a string, joining all strings with the contents of the IFS (Internal Field Separator)
# # NOTE: using IFS outside a block scope, it'll affect the rest of the code, so not really recommended
# IFS=$'\n' header_text="${header[*]}"
# echo "$header_text"
# # Hello, this is a header
# # This is another line
# # And here's some more text

# Helper function to join the contets of an array using a given separator
join_array() {
  local IFS="$1"
  shift
  echo "$*"
}

echo "--------------------"
header_text=$(join_array $'\n' "${header[@]}")
echo "$header_text"

echo "--------------------"
header_text="${header[*]}"
echo "$header_text"
