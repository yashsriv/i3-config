#!/usr/bin/bash

charge=$(acpi -b | grep -oP "\d+%" | tr -d "%")
status=$(acpi -b | awk '{print $3}')
echo $charge%
echo $charge%
if [[ $status == Dis* ]];
then
  if [[ $charge -lt 20 ]];
  then
    echo "#FF0000"
  elif [[ $charge -lt 40 ]];
  then
    echo "#FFAE00"
  elif [[ $charge -lt 60 ]];
  then
    echo "#FFF600"
  elif [[ $charge -lt 85 ]];
  then
    echo "#A8FF00"
  fi
else
  echo "#90CAF9"
fi
