#!/bin/env bash

read -r -d '' json_data << EOF
[
  { "name": "Alice", "admin": true },
  { "name": "Bob", "admin": false }
]
EOF

echo "$json_data" | jq '.[] | .name'
# Output:
# "Alice"
# "Bob"

# show output without the quotes
echo "$json_data" | jq -r '.[] | .name'
# Output:
# Alice
# Bob
