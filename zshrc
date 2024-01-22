#---------------------------------------------------------------------------------------
#-- THEMES AND PLUGINS -----------------------------------------------------------------

fi 

USE_POWERLINE="true" 
HAS_WIDECHARS="false" 

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
source ~/.config/zsh/zsh-history/zsh-history.zsh 

fpath=(~/.config/zsh/zsh-completions/src $fpath) 


#---------------------------------------------------------------------------------------
#-- INIT CONFIG ------------------------------------------------------------------------

HISTFILE=~/.config/zsh/histfile 
HISTSIZE=1000 
SAVEHIST=1000

setopt autocd extendedglob
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS

export EDITOR='~/Desktop/NVim.AppImage'
export grep=rg

export JULIA_DEPOT_PATH="$HOME/.local/share/julia:$JULIA_DEPOT_PATH"
export LESSHISTFILE="$HOME/.local/state/less/history"
export RUSTUP_HOME="$HOME/.local/share/rustup"
export XINITRC="$HOME/.config/X11/xinitrc"
export CARGO_HOME="$HOME/.local/share/cargo"
export CUDA_CACHE_PATH="$HOME/.cache/nv"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc"
export JAVA_OPTIONS="-Djava.util.prefs.userRoot=${HOME/.config}/java -Djavafx.cachedir=${HOME/.cache}/openjfx"

export PATH="$HOME/.config/tmux/plugins/tmuxifier/bin:$PATH" 
eval "$(tmuxifier init -)" 

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
compinit -d "$HOME/.cache"/zsh/zcompdump-"$ZSH_VERSION"


#---------------------------------------------------------------------------------------
#-- FUNCTIONS --------------------------------------------------------------------------

fullscreen() {
    xdotool key F11
    eval "$1"
    if [[ $? -eq 0 ]]; then
        xdotool key F11
    fi
    clear
}

function better_clear() {
    clear
    sh ~/.config/head.sh
    zle reset-prompt
}

zle -N better_clear


#---------------------------------------------------------------------------------------
#-- KEY BINDINGS -----------------------------------------------------------------------

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

bindkey -s '^[c' 'ssh core3b+ "sudo date -s" "\\"$(date)\\""; clear; ssh core3b+^M'


#---------------------------------------------------------------------------------------
#-- ALIASES ----------------------------------------------------------------------------

# package management
alias update='sudo nala update; sudo nala upgrade; flatpak update'
alias pkga='sudo nala install'
alias pkgs='nala search'
alias pkgr='sudo nala purge'
alias pkgx='sudo apt autoclean; sudo nala autoremove'
alias pkgh='nala history'
alias pkgu='sudo nala history undo'
alias pkgf='nala list --installed | grep -i'
alias pkgl='nala list --installed | less'
alias pkgc='dpkg --list | wc --lines'
pkgi() { whatis $1; echo ""; nala show $1; }

# flatpak 
alias fpa='flatpak install'
alias fpr='flatpak uninstall --delete-data'
alias fps='flatpak search'
alias fpl='flatpak list'
alias fpi='flatpak info'
alias fpx='flatpak remote-add --if-not-exists'

# file navigation
alias l='exa -l'
alias ls='exa'
alias lf='lfrun'
alias la='exa -la'
alias lsa='exa -a'
alias c='batcat -n'
alias cat='batcat -pp'
alias rmf='rm -rf'
alias tree='exa --tree --icons=always --group-directories-first'
cdir() {mkdir $1 && cd $1}
cmd()  { man -k $1|sed "s/ - \(.*\)/ - \o033[35m\1\o033[0m/"; }

# quick notes
alias nl="exa ~/Documents/notes/"
nr() { batcat -n ~/Documents/notes/$1 }
nw() { $EDITOR ~/Documents/notes/$1 }

# better defaults 
alias bnet='sudo bandwhich'
alias ss='sudo systemctl'
alias dockerd='sudo dockerd'
alias sv="sudo $EDITOR"
alias v=$EDITOR
alias vim=$EDITOR 
alias nano=$EDITOR
alias htop=btop
alias wget=wget --hsts-file="$HOME/.local/share/wget-hsts"

# simplified commands
alias battery='acpi -ib; echo "\nlast= 76%"'
alias fonts='fc-list | cut -f2 -d: | sort -u'
alias scan="prime-run clamscan -r --bell"
alias assem="objdump -M intel -D"
alias yt='yt-dlp'
alias irc="fullscreen weechat"
alias rss="fullscreen tuifeed"
alias tordown="cd ~/.local/share/torbrowser/tbb/x86_64/tor-browser/Browser/Downloads"
alias dcompu='sudo docker-compose up -d'
alias dcompd='sudo docker-compose down'
alias z=~/Desktop/zellij
alias wolf=librewolf

# silly scripts
alias tools="~/Projects/sillyScripts/tools.sh"
alias toolx="$EDITOR ~/Projects/sillyScripts/tools.sh"
alias colors='sh ~/Projects/sillyScripts/colors.sh'
alias periodic='sh ~/Projects/sillyScripts/periodic.sh'
alias resistor=~/Projects/sillyScripts/resistor
alias toipe='./.local/share/cargo/bin/toipe'
alias fetch='~/.config/fetch.sh'

# common dev cmds
alias ginit="~/Projects/.init/run.sh"
alias cinit="~/Projects/.init/cargo_run.sh"
alias readme="$EDITOR README.md"
alias gignore="$EDITOR .gitignore"
alias makefile="$EDITOR Makefile"
alias todo="$EDITOR todo"
alias erbuild="cargo rustc -- -C link-arg=--script=./linker.ld"
alias ercopy="aarch64-linux-gnu-objcopy -O binary ./target/aarch64-unknown-none/debug/rustpi_core ./mount/kernel7.img"
alias erdump="aarch64-linux-gnu-objdump -d target/aarch64-unknown-none/debug/rustpi_core"
srcmain() { $EDITOR ./src/main.$1 }

# tmux launch shortcuts
alias tmn="tmuxifier new-session"
alias tme="tmuxifier edit-session"
alias tmk="tmux kill-session -t"
alias tmka="tmux kill-session"
alias tml="tmux ls"
alias tmu='tmux source-file ~/.config/tmux/tmux.conf'
tm()  { fullscreen "tmuxifier load-session $1" }
tmd() { rm ~/.config/tmux/plugins/tmuxifier/layouts/$1.session.sh }

# zshrc manage
alias tedit="$EDITOR $HOME/.zshrc"
alias tupdate='source $HOME/.zshrc'


#---------------------------------------------------------------------------------------
#-- PROMPT -----------------------------------------------------------------------------

[[ ! -f ~/.config/powerlevel10k/p10k.zsh ]] || source ~/.config/powerlevel10k/p10k.zsh
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

