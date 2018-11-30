#!/bin/bash
GLOBAL_IP=$(dig +short myip.opendns.com @resolver1.opendns.com 2> /dev/null)

OUTPUT=""
if [[ $GLOBAL_IP != "" ]]; then
  OUTPUT="global: $GLOBAL_IP"
fi

LOCAL_IPS=$(ip addr | grep dynamic | awk '{print " " $8 ": " $2}' | sed 's/\/.*//')
for ip in $LOCAL_IPS; do
  OUTPUT="$OUTPUT $ip"
done

echo $OUTPUT
