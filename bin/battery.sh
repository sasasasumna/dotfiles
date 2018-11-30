#!/bin/bash
# Battery status (systray)
AC=$(</sys/class/power_supply/AC/online)
OUTPUT=""

# Battery is online: ICON % [CHARGING ICON]
if [ -f /sys/class/power_supply/BAT0/capacity ]; then
  BAT=$(</sys/class/power_supply/BAT0/capacity)
  OUTPUT=""
  if [ $BAT -gt 10 ] && [ $BAT -lt 31 ]; then
    OUTPUT=""
  elif [ $BAT -gt 30 ] && [ $BAT -lt 61 ]; then
    OUTPUT=""
  elif [ $BAT -gt 60 ] && [ $BAT -lt 81 ]; then
    OUTPUT=""
  elif [ $BAT -gt 80 ]; then
    OUTPUT=""
  fi
  OUTPUT="$OUTPUT $BAT%"
  # Online and charging
  if [ $AC -eq 1 ]; then
    OUTPUT="$OUTPUT "
  fi
else
  # AC only
  OUTPUT=""
fi

echo $OUTPUT

