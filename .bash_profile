#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# start X at login
[[ $(hostname) = "ATLAS" && -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
