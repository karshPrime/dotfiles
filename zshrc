#             _                   #
#     _______| |__  _ __ ___      #
#    |_  / __| '_ \| '__/ __|     #
#   _ / /\__ \ | | | | | (__      #
#  (_)___|___/_| |_|_|  \___|     #
#                                 #

#=====[ THEMES AND PLUGINS ]======#

# POWERLEVEL10K THEME
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# OhMyZSH
export ZSH="$HOME/.oh-my-zsh"
plugins=(git)
ZSH_THEME="powerlevel10k/powerlevel10k"
source $ZSH/oh-my-zsh.sh

# DEFAULTS
zstyle ':omz:update' frequency 13
DISABLE_AUTO_TITLE="true"
unsetopt correct_all
~/Dev/fetch/tinfo.sh


#=====[ FUNCTIONS AND ALIASES ]=====#

# GENERAL
cdir() {mkdir $1 && cd $1}
cmd() { man -k $1|sed "s/ - \(.*\)/ - \o033[35m\1\o033[0m/"; }
bindkey -s '^[z' 'clear; $HOME/Dev/fetch/header_fetch.sh^M'
alias update="sudo pacman -Syyuu"
alias config="vim ~/.config/i3/config" 

# PACKAGES
alias padd="sudo pacman -S"
alias prem="sudo pacman -Rns"
alias pfind="pacman -Qs"
alias plook="pacman -Ss"
alias pcount="pacman -Qq | wc -l"
alias pclean="paru --clean; sudo pacman -Scc; sudo pacman -Sc"

# GIT
grem() { git update-index --assume-unchanged $1 && rm $1 }
gremu() { git update-index --no-assume-unchanged $1 && git restore $1 }
gadd() {git add $1 $2 $3 $4 $5 $6 $7}
gtouch() {touch $1; git add $1; git commit -m "🍩 create $2 $3 $4 $5 $6 $7 $8"}
gupdate() {git commit -m "✨ update $1 $2 $3 $4 $5 $6 $7"}
gbug() {git commit -m "🐛 fixed $1 $2 $3 $4 $5 $6 $7"}
gboost() {git commit -m "🔧 fixed $1 $2 $3 $4 $5 $6 $7"}
gart() {git commit -m "🎨 $1 $2 $3 $4 $5 $6 $7"}
bindkey -s '^[m' 'git status^M'
bindkey -s '^[n' 'git commit -m "'
bindkey -s '^[,' 'git diff '
bindkey -s '^[.' 'git log^M'
alias greml="git ls-files -v|grep '^h'"
alias license="cp ~/Dev/LICENSE .; git add LICENSE; git commit -m '📚 GPL v2.0'"
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

# KEY MANAGEMENT
alias gpg-pub='gpg --export --armor --export-options export-minimal'
alias gpg-keys='gpg --list-secret-keys'

# SSH SHORTCUTS
alias ssh='kitty +kitten ssh'


#=====[ PowerLevel10k fixes ]=====#
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

