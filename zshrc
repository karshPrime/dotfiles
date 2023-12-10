#             _                   #
#     _______| |__  _ __ ___      #
#    |_  / __| '_ \| '__/ __|     #
#   _ / /\__ \ | | | | | (__      #
#  (_)___|___/_| |_|_|  \___|     #
#                                 #
# ==============================[ THEMES AND PLUGINS ]=============================== #

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

USE_POWERLINE="true"
HAS_WIDECHARS="false"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/zsh-history/zsh-history.zsh
fpath=(~/.config/zsh/zsh-completions/src $fpath)


# ====================================[ Init Config ]================================= #

~/.config/fetch.sh

HISTFILE=~/.config/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd extendedglob

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

autoload -Uz compinit

function better_clear() {
    clear
    sh ~/.config/head.sh
    zle reset-prompt
}

zle -N better_clear


# ====================================[ KEY BINDINGS ]================================ #

bindkey '^L' better_clear
bindkey -s '^[l' 'clear^M'
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


# ==========================[ FUNCTIONS AND ALIASES ]================================= #

cdir() {mkdir $1 && cd $1}
cmd() { man -k $1|sed "s/ - \(.*\)/ - \o033[35m\1\o033[0m/"; }

alias update='paru -Syu'
alias pkga='paru -S'
alias pkgs='paru -Ss'
alias pkgr='paru -Rcns'
alias pkgx='paru -Rns $(paru -Qdtq); paru -Sccc'
alias pkgf='paru -Qqs'
alias pkgc='paru -Qq | wc -l'
alias pkgl='pacman -Qq | less'
pkgi() { whatis $1 && paru -Si $1; }

alias bat='acpi -ib; echo "\nlast= 76%"'
alias fonts='fc-list | cut -f2 -d: | sort -u'
alias scan="prime-run clamscan -r --bell"
alias assem="objdump -M intel -D"

alias ss='sudo systemctl'
alias vim='nvim'
alias v='nvim'
alias sv='sudo nvim'
alias htop=bashtop
alias yt='yt-dlp'
alias rmf='rm -rf'
alias l='ls -lash'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

alias tordown="cd .local/share/torbrowser/tbb/x86_64/tor-browser/Browser/Downloads"
alias ginit="~/Projects/.init/run.sh"

alias erbuild="cargo rustc -- -C link-arg=--script=./linker.ld"
alias ercopy="aarch64-linux-gnu-objcopy -O binary ./target/aarch64-unknown-none/debug/rustpi_core ./mount/kernel7.img"
alias erdump="aarch64-linux-gnu-objdump -d target/aarch64-unknown-none/debug/rustpi_core"

# IRC
#alias irc="xdotool key F11; weechat"
weechat_alias() {
    xdotool key F11
    weechat
    if [[ $? -eq 0 ]]; then
        xdotool key F11;
        clear;
    fi
}

alias irc=weechat_alias

alias tedit='nvim ~/.zshrc'
alias tupdate='source ~/.zshrc'


# ======================================[ Prompt ]==================================== #

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme

