#!/bin/bash
###############################################################################################################
#   Filename: i3/i3nag.sh                                                                                     #
# Maintainer: Yash Srivastav <yashsriv01@gmail.com>                                                           #
#        URL: http://github.com/yashsriv/dotfiles                                                             #
#                                                                                                             #
# Shows warnings on low battery and hibernates automatically                                                  #
###############################################################################################################

SLEEP_TIME=5  # Time between checks
SAFE_PERCENT=30  # Chill hain
DANGER_PERCENT=15  # Warn
CRITICAL_PERCENT=5  # Hibernate

NAGBAR_PID=0
export DISPLAY=:0.0

function launchNagbar
{
  i3-nagbar -m 'Battery Low!!' &
  NAGBAR_PID=$!
}

function killNagbar
{
  if [[ $NAGBAR_PID -ne 0 ]]; then
    ps -p $NAGBAR_PID | grep "i3-nagbar"
    if [[ $? -eq 0 ]]; then
      kill $NAGBAR_PID
    fi
    NAGBAR_PID=0
  fi
}

while [ true ]; do
  killNagbar

  if [[ -n $(acpi -b | grep -i discharging) ]]; then
    rem_bat=$(acpi -b | grep -Eo "[0-9]+%" | grep -Eo "[0-9]+")

    if [[ $rem_bat -gt $SAFE_PERCENT ]]; then
      SLEEP_TIME=10
    else
      SLEEP_TIME=5
      if [[ $rem_bat -le $DANGER_PERCENT ]]; then
        SLEEP_TIME=2
        launchNagbar
      fi
      if [[ $rem_bat -le $CRITICAL_PERCENT ]]; then
        SLEEP_TIME=1
      fi
    fi
  else
    SLEEP_TIME=10
  fi

  sleep ${SLEEP_TIME}m

done
