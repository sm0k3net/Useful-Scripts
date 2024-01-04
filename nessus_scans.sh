#!/bin/bash

# Nessus credentials
ACCESS_KEY="123"
SECRET_KEY="123"

# Nessus server URL
NESSUS_URL="https://nessus:8834"

# API endpoint for listing scans
API_ENDPOINT="/scans"

# Execute Nessus API command
response=$(curl -s -k --request GET \
  --url "${NESSUS_URL}/${API_ENDPOINT}" \
  --header "X-ApiKeys: accessKey=${ACCESS_KEY}; secretKey=${SECRET_KEY}" \
  --header 'Content-Type: application/json'
)

# Calculate the timestamp
not_older=$(date -d '30 days ago' +%s)

# Extract scans with required folder_id and created not older than our timestamp
scans=$(echo "${response}" | jq -r --arg not_older "$not_older" '.scans | map(select(.folder_id == 3 and (.creation_date | tonumber) < ($not_older | tonumber)))')

# Loop through the filtered scans and print id
echo "${scans}" | jq -r '.[] | "\(if .creation_date then (.id) else "Not available" end)"'
