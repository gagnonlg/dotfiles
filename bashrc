# -*- mode: sh -*-
# ~/.bashrc
#

# If not running interactively
if [[ $- != *i* ]]; then
    if [[ $(hostname) =~ atlas[0-9][0-9]\.lps\.umontreal\.ca ]]; then
	export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
    fi
    return;
fi

# Source global definitions
[[ -f /etc/bashrc ]] && . /etc/bashrc

set -o allexport

# options
shopt -q checkwinsize

## environment variables

EDITOR="emacs"
PATH=~/bin:~/.local/bin:$PATH
PS1='[$?] ($(hostname)) $(basename $PWD)/ $ '
TERM=xterm-256color

## aliases

alias ls='ls --color=auto'
alias rm='rm -i'
alias root='root -l'

# Options above are default
# Particular cases are below

# running inside emacs
if [ "$INSIDE_EMACS" != "" ]; then
    alias git='git --no-pager'
fi

# on laptop only
if [ "$(hostname)" = "ATLAS" ]; then
    EDITOR="emacsclient -c"
    PATH=~/bin/scripts:$PATH
fi

# on lps
if [[ $(hostname) =~ atlas[0-9][0-9]\.lps\.umontreal\.ca ]]; then
    alias git='git --no-pager'
    unset PROMPT_COMMAND
    EDITOR="emacs -nw"
    GIT_SSL_NO_VERIFY=true
    PATH=~/local/bin:$PATH
    PERL5LIB=/home/zp/gagnon/local-root/lib/perl5/site_perl/5.8.8
    RUCIO_ACCOUNT=lgagnon
    WORKDIR=/lcg/storage15/atlas/gagnon

    # setupATLAS
    ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase
    alias setupATLAS=". ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh"
    setupATLAS_CMD="source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh"

    # c/c++ environment
    LIBRARY_PATH=$HOME/local/lib:$LIBRARY_PATH
    LD_LIBRARY_PATH=$HOME/.local/lib:$HOME/local/lib:$LD_LIBRARY_PATH
    C_INCLUDE_PATH=$HOME/local/include:$C_INCLUDE_PATH
    CPLUS_INCLUDE_PATH=$HOME/local/include:$CPLUS_INCLUDE_PATH

    function keepalive () {
	while true
	do
	    if [ -z "$@" ]; then
		echo 'keepalive'
	    else
		$@
	    fi
	    sleep 1m
	done
    }

    set +o allexport
    [[ -f /usr/local/bin/texlive2015.sh ]] && . /usr/local/bin/texlive2015.sh
    set -o allexport

fi

# on hades
if [ "$(hostname)" = "hades" ]; then
    PATH="/RQusagers/lgagnon/anaconda2/bin:$PATH"
fi

# on lxplus
if [[ $(hostname) =~ lxplus[0-9]+\.cern\.ch ]]; then
    WORK=/afs/cern.ch/work/l/lgagnon
    RUCIO_ACCOUNT=lgagnon
fi

set +o allexport
