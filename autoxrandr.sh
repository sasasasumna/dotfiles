#!/bin/bash

CONNECTED_DISPLAYS=$(xrandr | grep ' connected' | awk '{print $1}')
echo "Found displays: ${CONNECTED_DISPLAYS}"

CONNECTED_COUNT="$(xrandr | grep ' connected' | awk '{print $1}' | wc | awk '{print $1}')"
echo "Count: ${CONNECTED_COUNT}"

DISPLAY=""

if [ "${CONNECTED_COUNT}" -gt "1" ]; then
  DISPLAY="$(xrandr | grep ' connected' | awk '{print $1}' | grep '^DP')"
  if [[ "${DISPLAY}" == "" ]]; then
    DISPLAY="$(xrandr | grep ' connected' | awk '{print $1}' | grep '^HDMI')"
  fi
fi

if [[ "${DISPLAY}" == "" ]]; then
  DISPLAY="$(xrandr | grep ' connected' | awk '{print $1}' | grep '^eDP')"
fi

echo "Display: ${DISPLAY}"

xrandr --output "${DISPLAY}" --auto
