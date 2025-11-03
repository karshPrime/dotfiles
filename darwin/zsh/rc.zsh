
#            _
#    _______| |__  _ __ ___
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ | | | | | | (__
# (_/___|___|_| |_|_|  \___|
#

# Initialise ---------------------------------------------------------------------------------------

# ZSH history
HISTFILE="$HOME/.config/zsh/histfile"
HISTSIZE=500
SAVEHIST=500
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS

# cd into directories without cd
setopt autocd extendedglob

# Better auto-complete
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload -Uz compinit
compinit -C "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

# Fetch when not in TMux
[[ -z "$TMUX" ]] && bash ~/.config/fetch.sh

# Update PATH
if [[ ":$PATH:" != *"/Users/zul/Projects/.bin/"* ]]; then
    PATH="/opt/homebrew/bin:$PATH:"
    PATH+="/opt/homebrew/opt/openjdk/bin:"
    PATH+="/Users/zul/Projects/.bin/:"
    PATH+="/Applications/Docker.app/Contents/Resources/bin/"

    export PATH
fi


# Explicit Declaration -----------------------------------------------------------------------------

# System specific configs
export EDITOR=nvim
export DOTFILES="$HOME/.config/dotfiles/darwin"
export HACK_SCRIPTS="$HOME/Projects/SysHacks"
export HOMEBREW_NO_ENV_HINTS=1

# Save path for go packages
export GOPATH=$HOME/.local/share/go
export FZF_DEFAULT_OPTS="-i --cycle --ansi --color=dark --layout=reverse\
	--pointer='▶ ' --prompt='  '"
export FZF_DEFAULT_COMMAND='find . -maxdepth 1 ! -path "*git*"'

export GPG_TTY=$(tty)
#gpgconf --launch gpg-agent


# Integrations -------------------------------------------------------------------------------------

# Starship Prompt
eval "$(starship init zsh)"

# fzf 
eval "$(fzf --zsh)"

# Plugins
source "$HOME/.config/zsh/highlighting/zsh-syntax-highlighting.zsh"
source "$HOME/.config/zsh/autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.config/zsh/history/zsh-history-substring-search.zsh"
source "$HOME/.config/zsh/karSH/devedit.zsh"
source "$HOME/.config/zsh/karSH/benches.zsh"

# Other Configs
source "$HOME/.config/dotfiles/darwin/zsh/navigations.zsh"  # file processing
source "$HOME/.config/dotfiles/darwin/zsh/management.zsh"   # manage config files
source "$HOME/.config/dotfiles/darwin/zsh/convenience.zsh"  # aliases & keybinds
source "$HOME/.config/dotfiles/darwin/zsh/devenv.zsh"       # development shortcuts
source "$HOME/.config/dotfiles/darwin/zsh/hacks.zsh"        # :)

