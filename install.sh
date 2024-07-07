#!/usr/bin/env bash

#--# Helper #-----------------------------------------------------------------------------

# more consistent errors
error() {
    echo -e "\033[31mError: \033[0m$1"
    exit 1
}

# check if an argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: ./install.sh <system>"
    error "No argument provided"
fi

# create symlink and preserve existing
symlink() {
    mv "$HOME/.config/$2" "$HOME/.config/$2.old" 2>/dev/null
    ln -s "$1/$2" "$HOME/.config/$2"
}


#--# Initialise Repository #-------------------------------------------------------------

mkdir -p $HOME/.config
mv "$HOME/.config/dotfiles" "$HOME/.config/dotfiles.old" 2>/dev/null
git clone --depth=1 "https://github.com/karshPrime/dotfiles" $HOME/.config/dotfiles


#--# System Specifics #------------------------------------------------------------------

case $1 in
    darwin)
        echo "Configuring Darwin"
        CONFIGS="$HOME/.config/dotfiles/darwin"
        git sparse-checkout set darwin shared

        symlink "$CONFIGS" "alacritty" # alacritty
        ;;

    server)
        echo "Configuring Server"
        CONFIGS="$HOME/.config/dotfiles/server"
        git sparse-checkout set server shared

        symlink "$CONFIGS" "lf"    # lf
        ;;

    *)
        error "Unrecognized config $1"
        exit 1
        ;;
esac


#--# SymLinks #--------------------------------------------------------------------------

symlink "$CONFIGS" "nvim"          # Neovim Editor
symlink "$CONFIGS" "tmux"          # tmux multiplexer
symlink "$CONFIGS" "starship.toml" # Starship Prompt
symlink "$CONFIGS" "fetch.sh"      # Terminal Fetch

# Z SHell
mv "$HOME/.zshrc" "$HOME/.zshrc.old" 2>/dev/null
ln -s "$CONFIGS/zsh/zshrc" "$HOME/.zshrc"
## plugins
mv "$HOME/.config/zsh" "$HOME/.config/zsh.old" 2>/dev/null
mkdir "$HOME/.config/zsh"
cd $HOME/.config/zsh
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-history-substring-search.git history
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git highlighting

