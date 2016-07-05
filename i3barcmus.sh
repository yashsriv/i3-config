#!/bin/bash
###############################################################################################################
#   Filename: i3/i3barcmus                                                                                    #
# Maintainer: Yash Srivastav <yashsriv01@gmail.com>                                                           #
#        URL: http://github.com/yashsriv/dotfiles                                                             #
#                                                                                                             #
# Adds support for cmus in i3 bar                                                                             #
###############################################################################################################

if [ -f /etc/arch-release ]; then
  file="~/.i3/i3statusarch.conf"
else
  file="~/.i3/i3status.conf"
fi

# shell script to prepend i3status with cmus song and artist
i3status -c $file | (read line && echo $line && read line && echo $line && while :
do
  read line
  stat=$(cmus-remote -Q 2> /dev/null | grep status | cut -d ' ' -f2-)
  artist=$(cmus-remote -Q 2> /dev/null | grep ' artist ' | cut -d ' ' -f3-)
  song=$(cmus-remote -Q 2> /dev/null | grep title | cut -d ' ' -f3-)
  if [[ "$stat" != "" ]]; then
    dat="$artist - $song                  "
    if [[ "$stat" == "playing" ]]; then
      col="#c6ff00"
    elif [[ "$stat" == "paused" ]]; then
      col="#212121"
    else
      col="#ff1111"
    fi
    dat="[{ \"name\":\"music\",\"color\":\"$col\",\"full_text\":\"${dat}\" }, "
  else
    dat="["
  fi
  echo "${line/[/$dat}" || exit 1
done)
