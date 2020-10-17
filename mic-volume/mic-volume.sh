#!/bin/sh

if [ -z "$1" ]
then
  volume=$(pacmd list-sources | grep "\* index:" -A 7 | grep "volume" | awk -F/ '{print $2}')
else
  volume=$(pacmd list-sources | grep "$1" -A 6 | grep "volume" | awk -F/ '{print $2}')
fi

if [ -z "$volume" ]
then
  echo "No Mic Found"
else
  echo "$volume"
fi
