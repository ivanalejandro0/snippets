#!/bin/env bash

read -r -d '' json_data << EOF
[
  { "name": "Alice", "admin": true },
  { "name": "Bob", "admin": false }
]
EOF

# show only admins
echo "$json_data" | jq '.[] | select(.admin)'
# Output:
# {
#   "name": "Alice",
#   "admin": true
# }

# show only non-admins
echo "$json_data" | jq '.[] | select(.admin | not)'
# Output:
# {
#   "name": "Bob",
#   "admin": false
# }

read -r -d '' json_data << EOF
[
  { "id": "1234", "count": 0 },
  { "id": "2345", "count": 10 },
  { "id": "3456", "count": 20 },
  { "id": "6789", "count": 30 }
]
EOF

echo "$json_data" | jq '.[] | select(.count > 10)'
# Output:
# {
#   "id": "3456",
#   "count": 20
# }
# {
#   "id": "6789",
#   "count": 30
# }


echo "$json_data" | jq '[.[] | select(.count > 10)]'
# Output:
# [
#   {
#     "id": "3456",
#     "count": 20
#   }
#   {
#     "id": "6789",
#     "count": 30
#   }
# ]
