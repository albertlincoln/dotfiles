# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=erasedups:ignorespace
HISTIGNORE='??'
HISTSIZE=500
HISTFILESIZE=10000

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

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

if [ -d "/tmp/home/all" ] ; then
    export ALL_TMP_DIR=/tmp/home/all
    mkdir -p $ALL_TMP_DIR/.cache
    export XDG_CACHE_HOME=$ALL_TMP_DIR/.cache
    #HISTFILE=$ALL_TMP_DIR/.bash_history
    export LESSHISTFILE=$ALL_TMP_DIR/.lesshst
fi

for i in "aliases" "git-completion" "ssh-completion"; do

    if [ -f "${HOME}/.config/bash/${i}.bash" ]; then
        . "${HOME}/.config/bash/${i}.bash"
    fi
done

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -x /usr/bin/rbenv ]; then
    eval "$(rbenv init -)"
fi

if [ -x /usr/bin/direnv ]; then
    eval "$(direnv hook bash)"
fi


GPG_TTY=`tty` 
export GPG_TTY 

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
