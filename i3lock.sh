#!/bin/bash
###############################################################################################################
#   Filename: i3/i3lock.sh                                                                                    #
# Maintainer: Yash Srivastav <yashsriv01@gmail.com>                                                           #
#        URL: http://github.com/yashsriv/dotfiles                                                             #
#                                                                                                             #
# Custom lock settings                                                                                        #
###############################################################################################################

# Take a screenshot
#scrot /tmp/screen_locked.png

# Blur
#convert /tmp/screen_locked.png -blur 4x4 /tmp/screen_locked2.png
#rm /tmp/screen_locked.png

# Lock screen displaying this image.
test=$(ps -A | grep "mpv")
if [[ -n $test ]]; then
  echo 'Nope'
else
  #i3lock -d -i /tmp/screen_locked2.png -c '#000000' -o '#191d0f' -w '#572020' -l '#ffffff' -e
  i3lock -d -i ~/Documents/hexcolors.png  -c '#000000' -o '#191d0f' -w '#572020' -l '#ffffff' -e
fi
