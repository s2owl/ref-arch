#!/bin/bash
set -euo pipefail

# ---- CONFIG ----
INSTANCE="hsbcitid.service-now.com"
USER="your.username"
INC_LIST_FILE="inc_numbers.txt"   # one INC number per line
OUTFILE="inc_report.csv"

# Proxy config - set PROXY to empty string "" if not needed
PROXY="http://proxyhost:port"

read -s -p "Enter SNOW password: " PASS
echo

BASE="https://${INSTANCE}/api/now/table"
AUTH="${USER}:${PASS}"

PROXY_ARGS=()
if [ -n "$PROXY" ]; then
  PROXY_ARGS=(-x "$PROXY")
fi

echo "inc_number,state,short_description,business_impact,opened_at,assignment_group" > "$OUTFILE"

while read -r INC; do
  [ -z "$INC" ] && continue

  INC_DATA=$(curl -s "${PROXY_ARGS[@]}" -u "$AUTH" \
    -H "Accept: application/json" \
    "${BASE}/incident?sysparm_query=number=${INC}&sysparm_fields=number,state,short_description,business_impact,opened_at,assignment_group&sysparm_display_value=true")

  STATE=$(echo "$INC_DATA" | jq -r '.result[0].state // "NOT_FOUND"')
  DESC=$(echo "$INC_DATA" | jq -r '.result[0].short_description // ""' | tr ',' ';')
  IMPACT=$(echo "$INC_DATA" | jq -r '.result[0].business_impact // ""' | tr ',' ';')
  OPENED=$(echo "$INC_DATA" | jq -r '.result[0].opened_at // ""')
  GROUP=$(echo "$INC_DATA" | jq -r '.result[0].assignment_group // ""' | tr ',' ';')

  echo "${INC},${STATE},\"${DESC}\",\"${IMPACT}\",${OPENED},\"${GROUP}\"" >> "$OUTFILE"
  echo "Pulled ${INC}: ${STATE}"
done < "$INC_LIST_FILE"

echo "Done. Output: $OUTFILE"
