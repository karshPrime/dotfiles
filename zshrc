#             _                   #
#     _______| |__  _ __ ___      #
#    |_  / __| '_ \| '__/ __|     #
#   _ / /\__ \ | | | | | (__      #
#  (_)___|___/_| |_|_|  \___|     #
#                                 #

#=====[ THEMES AND PLUGINS ]======#

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


#=====[ THEMES AND PLUGINS ]======#

# Lines configured by zsh-newuser-install
HISTFILE=~/.config/zsh/histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -e

# End of lines configuration
zstyle :compinstall filename '/home/ut-kr/.zshrc'

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

autoload -Uz compinit
compinit


#=====[ FUNCTIONS AND ALIASES ]=====#

# GENERAL
cdir() {mkdir $1 && cd $1}
cmd() { man -k $1|sed "s/ - \(.*\)/ - \o033[35m\1\o033[0m/"; }
alias l='ls -lash'
alias update="paru"

# Additional Keys Support
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[A"    history-beginning-search-backward
bindkey "^[[B"    history-beginning-search-forward
bindkey -s '^[z' 'clear; $HOME/Programs/fetch/header_fetch.sh^M'

# PACKAGES
alias padd="sudo pacman -S"
alias prem="sudo pacman -Rns"
alias pfind="pacman -Qs"
alias plook="pacman -Ss"
alias pcount="pacman -Qq | wc -l"
alias pclean="paru --clean; sudo pacman -Sc"

# GIT
grem() { git update-index --assume-unchanged $1 && rm $1 }
gremu() { git update-index --no-assume-unchanged $1 && git restore $1 }
gtouch() {touch $1; git add $1; git commit -m "🍩 create $2 $3 $4 $5 $6 $7 $8"}
bindkey -s '^[a' 'git add '
bindkey -s '^[u' '✨ '
bindkey -s '^[b' '🐛 '
bindkey -s '^[f' '🔧 '
bindkey -s '^[c' '🎨 '
bindkey -s '^[r' '🚚 '
bindkey -s '^[\' 'git push^M'
bindkey -s '^[m' 'git status^M'
bindkey -s '^[n' 'git commit -m "'
bindkey -s '^[,' 'git diff '
bindkey -s '^[.' 'git log^M'
alias greml="git ls-files -v|grep '^h'"
alias license="cp ~/Programs/LICENSE .; git add LICENSE; git commit -m '📚 GPL v2.0'"
alias readme="touch README.md; git add README.md; git commit -m '📚 readme'"

# CONFIG FILE
alias tedit='vim $HOME/.zshrc'
alias tupdate='source $HOME/.zshrc'

# EASE OF LIFE
alias sv="sudo vim"
alias v="vim"
alias ss"sudo systemctl"
alias bandwhich="sudo bandwhich; clear"
alias fonts='fc-list | cut -f2 -d: | sort -u'
alias batlim='sudo systemctl start battery-charge-threshold.service'
alias rmf='rm -rf'
alias yt='yt-dlp'

# KEY MANAGEMENT
alias gpg-pub='gpg --export --armor --export-options export-minimal'
alias gpg-keys='gpg --list-secret-keys'


#=====[ PowerLevel10k fixes ]=====#

# End of lines added by compinstall
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


#================================#
