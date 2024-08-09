
#- MANAGEMENT ------------------------------------------------------------------
#- manage configurations -------------------------------------------------------

# Neovim Configs
nedit() {
    pushd $DOTFILES/nvim/lua/ > /dev/null;
	vi lua .
    popd > /dev/null
}

# ZSH Configs
zedit() {
    pushd $DOTFILES/zsh > /dev/null;
	vi .
    popd > /dev/null
}
alias zupdate="source ~/.zshrc"

# TMux Config
alias tedit="$EDITOR $DOTFILES/tmux/tmux.conf"
alias tupdate="tmux source-file $DOTFILES/tmux/tmux.conf"

# Alacritty Config
alias aedit="$EDITOR $DOTFILES/alacritty/alacritty.toml"

