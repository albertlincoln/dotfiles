case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=erasedups:ignorespace
HISTIGNORE='??'
#HISTSIZE=500
HISTFILESIZE=10000
if [ -z "$XDG_RUNTIME_DIR" ]; then
    mkdir -p /run/shm/$(id -u)
    export XDG_RUNTIME_DIR=/run/shm/$(id -u)
fi
export HISTFILE=$XDG_RUNTIME_DIR/.history

export EDITOR=vim

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s no_empty_cmd_completion
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

color_prompt=yes
operating_system_id="/`cat /etc/os-release | grep ^ID= | cut -d'=' -f 2`:"
operating_system_id=''
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u🐞\[\033[01;32m\]\h${operating_system_id}:\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]💲 '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\u 🌱 \[\033[01;32m\]\h${operating_system_id}:\[\033[00m\]\[\033[01;34m\]\w\[\033[00m\]💲 '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -d "$HOME/n" ]; then
    export N_PREFIX="$HOME/n";
elif [ -d "/opt/n" ]; then
    export N_PREFIX="/opt/n";
fi
[[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).


if [ ! -d $XDG_RUNTIME_DIR/vim ]; then
    mkdir -p $XDG_RUNTIME_DIR/vim
fi

if [ ! -e ~/.vim-tmp ]; then
    ln -s $XDG_RUNTIME_DIR/vim ~/.vim-tmp
fi

which keychain > /dev/null 2>&1

if [ "$?" = "0" ] && [ "$DISPLAY" = "" ]; then
    eval `ls ~/.ssh/*.pub | sed s/.pub//g | xargs ls | xargs keychain --eval -q`
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

GPG_TTY=`tty` 
if [ "$SHLVL" = "1" ]; then
    export GPG_TTY 
fi
