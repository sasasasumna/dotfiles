#!/bin/sh
pid=$(pidof compton)
if [ $pid ]; then
  echo "Disabling compositor"
  killall compton
else
  echo "Enabling compositor"
  compton -b
fi

