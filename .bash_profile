#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# start X at login
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
