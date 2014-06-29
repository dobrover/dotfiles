#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
export PROMPT_COMMAND=
alias ls='ls --color=auto -h'
alias nano="emacs -nw"
export EDITOR=vim
function pstcb {
    { tee /dev/fd/4 | pastebinit | cb > /dev/null ;} 4>&1
}

function cb {
    IFS= read -rd '' data
    printf "%b" "$data"| perl -0 -pe 's/\n\Z//' | parcellite > /dev/null
    printf "%b" "$data"
}

function xrel {
    saved=$(xrdb -query | egrep "^Xstorage\.AWM\.")
    xrdb ~/.Xresources
    printf "%b\n" "$saved" | xrdb -merge
}

PS1='[\u@\h \w]\$ '
EDITOR="vim"

export FIGNORE=$FIGNORE:orkmanir # Ignore workmanir
source /usr/share/doc/pkgfile/command-not-found.bash
export PATH=$PATH:/home/y/.gem/ruby/2.0.0/bin
alias watchcpu="watch grep \\\"cpu MHz\\\" /proc/cpuinfo"

# Ven related stuff
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
export VIRTUALENVWRAPPER_SCRIPT=/usr/bin/virtualenvwrapper.sh
source /usr/bin/virtualenvwrapper_lazy.sh


alias ipymath='ipython --profile=math --matplotlib qt4'
export PROMPT_COMMAND='RETRN_VAL=$?;echo >>~/.eternal_history "$(history 1 | sed "s/^[ ]*[0-9]\+[ ]*//")"'
export PYTHONSTARTUP=~/.pythonrc
