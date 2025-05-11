#!/bin/env bash
distros=(
    'jessie'
    'sid'
    'saucy'
    'trusty'
    'utopic'
)

echo "distros: ${distros[*]}"

my_distro='trusty'
# next line will match 'trusty', expected
[[ ${distros[*]} =~ $my_distro ]] && echo 'match' || echo 'no match'

my_distro='trust'
# next line will match 'trust', not expected
[[ ${distros[*]} =~ $my_distro ]] && echo 'match' || echo 'no match'

my_distro='asdf'
# next line won't match 'asdf', expected
[[ ${distros[*]} =~ $my_distro ]] && echo 'match' || echo 'no match'

# this works as expected finding 'trusty' and not finding 'trust'
find_item() {
  local item=$1
  shift
  local elements=("$@")
  for e in "${elements[@]}"; do
    if [[ $item == "$e" ]]; then
      echo true
      return
    fi
  done
  echo false
}

my_distro='trusty'
find_item $my_distro "${distros[@]}"

my_distro='trust'
find_item $my_distro "${distros[@]}"
