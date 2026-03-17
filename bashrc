#
#   | |__   __ _ ___| |__  _ __ ___
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__
# (_)_.__/ \__,_|___/_| |_|_|  \___|
#


# --------------------------------------------------------------------------------------------------

# Don't do anything if not running interactively
case $- in
    *i*) ;;
    *) return;;
esac

shopt -s globstar
shopt -s checkwinsize
shopt -s histappend

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# -------------------- Colour Configs

force_color_prompt=yes
unset color_prompt force_color_prompt

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \n\$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_oclor_prompt


if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias diff="diff --color='always'"
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# -------------------- Completion

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi


# -------------------- Completion

fetch() {
    UPTIME=$(uptime | cut -d ',' -f1-2 | tr -d "u," | tr "p" "|")
    MEMORY=$(free -h | grep Mem | tr -d " bB" | cut -d "i" -f2)
    STORAGE=$(df -h | grep "nvme0n1p2" | tr -d " " | cut -d "G" -f2 )

    echo [$UPTIME "|" $MEMORY/16G "|" $STORAGE\G/500G ]
}
fetch


# --------------------------------------------------------------------------------------------------
# - ALIASES ----------------------------------------------------------------------------------------

# -------------------- Package Management

alias pkga="sudo apt install"
alias pkgr="sudo apt purge"
alias pkgs="apt search"
alias pkgl="apt list --installed | less"
alias pkgi="apt show"
alias pkgx="sudo apt autoclean; sudo apt autoremove"
alias update="
    sudo apt update;
    sudo apt upgrade;
    sudo apt autoclean;
    sudo apt autoremove
"
alias n8nupdate="
    sudo docker pull docker.n8n.io/n8nio/n8n;
"

# -------------------- Ease

alias reboot='sudo reboot'
alias shutdown='sudo shutdown -h now'
alias docker='sudo docker'
alias ip='hostname -I'
alias disk='df -h'
alias cpuinfo='cat /proc/cpuinfo'
alias meminfo='cat /proc/meminfo'
alias weather="curl wttr.in/melbourne"

alias path="echo $PATH | tr ':' '\n'"
alias re="grep -o -E"
alias sed="sed -r"
alias cl='clear; fetch'
alias btop='sudo btop'
alias ntop="sudo ~/.localBin/bandwhich"
alias dtop="sudo ~/.localBin/lazydocker"
alias n8n='sudo docker run -it --rm --name n8n --network connection8n -p 5678:5678 -e GENERIC_TIMEZONE="Australia/Melbourne" -e TZ="Australia/Melbourne" -e N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true -e N8N_RUNNERS_ENABLED=true -e N8N_SECURE_COOKIE=false -v /home/karsh/Projects/n8n:/home/node/scripts -v n8n_data:/home/node/.n8n docker.n8n.io/n8nio/n8n'

alias free='free -h'
alias df='df -h'

alias cli='sudo systemctl stop lightdm.service'

# -------------------- Editor

export EDITOR=/home/karsh/Projects/neovim/bin/nvim

alias v=$EDITOR
alias sv="sudo $EDITOR"
alias py=python3
alias zedit="$EDITOR ~/.bashrc"
alias zupdate="source ~/.bashrc"
alias nedit="pushd ~/.config/nvim/lua/"


# -------------------- Navigation

alias l='ls -lash'
alias x=exit
alias ta="tmux attach"
alias rmwd='current=$(pwd); cd ..; rm -rf "$current";'

cdir() {
    mkdir $1 && cd $1
}

count() {
    ls $1 | wc -l | tr -d ' '
}


# -------------------- Readings

alias temp='vcgencmd measure_temp'
alias volt='vcgencmd measure_volts'
alias freq='vcgencmd measure_clock arm'
alias gpu='vcgencmd measure_clock core'
alias power='vcgencmd get_throttled'

# --------------------------------------------------------------------------------------------------

