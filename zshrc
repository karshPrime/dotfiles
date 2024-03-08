# --------------------------------------------------------------------------------------
# -- THEMES AND PLUGINS ----------------------------------------------------------------

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then 
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" 
fi 

USE_POWERLINE="true" 
HAS_WIDECHARS="false" 

source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh 
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
source ~/.config/zsh/zsh-history/zsh-history.zsh 

fpath=(~/.config/zsh/zsh-completions/src $fpath) 


# --------------------------------------------------------------------------------------
# -- INIT CONFIG -----------------------------------------------------------------------

HISTFILE=~/.config/zsh/histfile 
HISTSIZE=1000 
SAVEHIST=1000

setopt autocd extendedglob
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS

export EDITOR=nvim
export grep=rg

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export JULIA_DEPOT_PATH="$XDG_DATA_HOME/julia:$JULIA_DEPOT_PATH"
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export JAVA_OPTIONS="-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java -Djavafx.cachedir=${XDG_CACHE_HOME}/openjfx"
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export XAUTHORITY="$XDG_CONFIG_HOME"/Xauthority


export PATH="$HOME/.config/tmux/plugins/tmuxifier/bin:$PATH" 
eval "$(tmuxifier init -)" 

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"


# --------------------------------------------------------------------------------------
# -- FUNCTIONS -------------------------------------------------------------------------


# hide directory path for git repositories
function zsh_directory_name() {
  emulate -L zsh
  [[ $1 == d ]] || return
  while [[ $2 != / ]]; do
    if [[ -e $2/.git ]]; then
      typeset -ga reply=(${2:t} $#2)
      return
    fi
    2=${2:h}
  done
  return 1
}

function count() {
    ls $1 | wc -l
}

# fullscreen terminal emulator while program's running
fullscreen() {
    xdotool key F11
    eval "$1"
    if [[ $? -eq 0 ]]; then
        xdotool key F11
    fi
    clear
}

# maximise terminal emulator while program's running
maximise() {
    xdotool key --clearmodifiers Super_L+Up
    eval "$1"
    if [[ $? -eq 0 ]]; then
	xdotool key --clearmodifiers Super_L+Down
    fi
    clear
}

# clear the terminal with head.sh fetch script 
function better_clear() {
    clear
    sh ~/.config/head.sh
    zle reset-prompt
}

zle -N better_clear


# --------------------------------------------------------------------------------------
# -- KEY BINDINGS ----------------------------------------------------------------------

bindkey '^l' better_clear
bindkey "^[l" clear-screen
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^H' backward-kill-word
bindkey '^[[3;5~' kill-word

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bindkey -s '^U' 'clear-line\n'
bindkey -s '^[c' 'ssh core3b+ "sudo date -s" "\\"$(date)\\""; clear; ssh core3b+^M'


# --------------------------------------------------------------------------------------
# -- ALIASES ---------------------------------------------------------------------------

# package management
alias pkga='sudo zypper install --no-recommends'
alias pkgs=opi	
alias pkgr='sudo zypper rm --clean-deps'
alias pkgh='zypper history'
alias pkgf='rpm -qa | grep -i'
alias pkgl='rpm -qa | less'
alias pkgc='rpm -qa | wc -l'
pkgx() {
    sudo zypper clean; 
    sudo zypper rm --clean-deps $(zypper packages --unneeded | awk '{print $5}')
    flatpak uninstall --unused;
}
pkgi() { 
    whatis $1; 
    echo ""; 
    zypper info $1; 
} 
update() {
    sudo zypper refresh; 
    sudo zypper update
    sudo zypper dup;
    echo -e "\nFlatpacks: ";
    flatpak update;
}

# flatpak 
alias fpa='flatpak install'
alias fpr='flatpak uninstall --delete-data'
alias fpR='flatpak uninstall --all'
alias fps='flatpak search'
alias fpl='flatpak list'
alias fpi='flatpak info'
alias fpx='flatpak remote-add --if-not-exists'

# file navigation
alias l='eza -la --color=always --group-directories-first'
alias ls='eza'
alias lh='eza -a | egrep "^\."'
alias la='eza -a --color=always --group-directories-first'
alias c='bat -n'
alias cat='bat -pp'
alias rm='rm -rf'
alias srm='sudo rm -rf'
cdir() {mkdir $1 && cd $1}
cmd()  { man -k $1|sed "s/ - \(.*\)/ - \o033[35m\1\o033[0m/"; }

# places
alias desk='cd ~/Desktop'
alias down='cd ~/Downloads'
alias docs='cd ~/Documents'
alias proj='cd ~/Projects'
alias conf='cd ~/.config'

# quick notes
alias nl="eza ~/Documents/notes/"
nr() { bat -n ~/Documents/notes/$1 }
nw() { $EDITOR ~/Documents/notes/$1 }
nd() { rm ~/Documents/notes/$1 }
alias td="$EDITOR ~/Documents/notes/todo"

# better defaults 
alias bnet='sudo bandwhich'
alias ss='sudo systemctl'
alias dockerd='sudo dockerd'
alias sv="sudo $EDITOR"
alias v=$EDITOR
alias vim=$EDITOR 
alias nano=$EDITOR
alias htop=btop
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

# python development
alias py=python3
alias pye='python3 -m venv environment'
alias pys='source ./environment/bin/activate'
alias pyx='deactivate'

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
alias dothome='sh ~/Desktop/ninja/xdg-ninja.sh --skip-unsupported'

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

# git shortcuts
alias gita='git add'
alias gitA='git add -A'
alias gitc='git commit'
alias gitC='git commit -m'
alias gitd='git diff'
alias gitl='git log'
alias gits='git status'
alias gitp='git push'
alias gitP='git push --force'
alias gith='git checkout'
alias gitb='git branch'
alias gitu="git reset --soft 'HEAD^'"
gitt() { touch $1; git add $1; git commit -m "🍩 create $1" }

# tmux launch shortcuts
alias tmn="tmuxifier new-session"
alias tme="tmuxifier edit-session"
alias tmk="tmux kill-session -t"
alias tmK="tmux kill-session"
alias tml="tmux ls"
alias tmu='tmux source-file ~/.config/tmux/tmux.conf'
tm()  { fullscreen "tmuxifier load-session $1" }
tmd() { rm ~/.config/tmux/plugins/tmuxifier/layouts/$1.session.sh }
tmL() { 
    exa ~/.config/tmux/plugins/tmuxifier/layouts | awk -F\. '{ORS=" "; print $1}'; 
    echo ""
}

# dotfiles manage
dotfiles() {
    cd ~/Projects/dotfiles;
    cp ~/.config/nvim/init.lua ./vimrc;
    cp ~/.config/tmux/tmux.conf ./tmux.conf;
    cp ~/.config/zsh/.zshrc ./zshrc;
}
alias nedit="$EDITOR $HOME/.config/nvim/init.lua"
alias medit="$EDITOR $HOME/.config/tmux/tmux.conf"
alias tedit="$EDITOR $HOME/.config/zsh/.zshrc"
alias tupdate='source $HOME/.config/zsh/.zshrc'


# --------------------------------------------------------------------------------------
# -- PROMPT ----------------------------------------------------------------------------

[[ ! -f ~/.config/powerlevel10k/p10k.zsh ]] || source ~/.config/powerlevel10k/p10k.zsh
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

