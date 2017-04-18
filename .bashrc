#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## environment variables

export EDITOR=emacs
export PATH=~/.local/bin:$PATH
export PS1='[$?] ($(hostname)) $(basename $PWD)/ $ '

## aliases

alias ls='ls --color=auto'
alias rm='rm -i'
alias git='git --no-pager'
