#!/bin/bash
GLOBAL_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
if [[ $GLOBAL_IP == "" ]]; then
  GLOBAL_IP="unknown"
fi

OUTPUT="global: $GLOBAL_IP"
LOCAL_IPS=$(ip addr | grep dynamic | awk '{print " " $8 ": " $2}' | sed 's/\/.*//')
for ip in $LOCAL_IPS; do
  OUTPUT="$OUTPUT $ip"
done

echo $OUTPUT
