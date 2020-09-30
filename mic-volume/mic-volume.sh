#!/bin/sh

if [ -z "$1" ]
then
  echo "No Input Provided"
else
  volume=$(pacmd list-sources | grep "$1" -A 6 | grep "volume" | awk -F/ '{print $2}')

  if [ -z "$volume" ]
  then
    echo "No Mic Found"
  else
    echo "$volume"
  fi
fi
