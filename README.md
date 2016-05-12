# i3wm - A tiling window manager

![Screen](https://raw.githubusercontent.com/yashsriv/i3-config/master/Screen.png)
This is my configuration for `i3wm` a tiling window manager  
The description of the different files are given below.

## Files

### background

Sets my background after choosing a random image from my
[xkcd](http://xkcd.com) archive. Uses `feh`. This keeps
in sync with my `conky` which displays the title and hover text
by getting data from `~/.current_comic`

### i3barcmus.sh

A custom bash script for i3bar which displays song information
if `cmus` is running, including green for playing, grey for paused
and red for stopped.

### i3lock.sh

My custom lock script which only locks if `mplayer` is not running.
Generates lock screen by blurring a screenshot of the current screen.

### i3nag.sh

Script to nag me on low battery using i3-nag

### i3status.conf

Settings for i3bar itself such as volume display.

### config

My main config which contains varied features
