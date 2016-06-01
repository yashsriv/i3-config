#!/bin/bash
###############################################################################################################
#   Filename: i3/i3lock.sh                                                                                    #
# Maintainer: Yash Srivastav <yashsriv01@gmail.com>                                                           #
#        URL: http://github.com/yashsriv/dotfiles                                                             #
#                                                                                                             #
# Custom lock settings                                                                                        #
###############################################################################################################

# Take a screenshot
scrot /tmp/screen_locked.png

# Blur
convert /tmp/screen_locked.png -blur 4x4 /tmp/screen_locked2.png
rm /tmp/screen_locked.png

# Lock screen displaying this image.
ps -e | grep "mplayer"
if [[ $? -ne 0 ]]; then
  i3lock -e -d -i /tmp/screen_locked2.png
fi
