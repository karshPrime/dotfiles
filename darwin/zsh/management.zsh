
#- MANAGEMENT ------------------------------------------------------------------
#- manage configurations -------------------------------------------------------

# Neovim Configs
nedit() {
    pushd $DOTFILES/nvim/lua/ > /dev/null;
    $EDITOR $(fzf -m --preview="bat --color=always --number {}");
    popd > /dev/null
}

# ZSH Configs
zedit() {
    pushd $DOTFILES/zsh > /dev/null;
    $EDITOR $(fzf -m --preview="bat --color=always --number {}");
    popd > /dev/null
}
alias zupdate="source ~/.zshrc"

# TMux Config
alias tedit="$EDITOR $DOTFILES/tmux/tmux.conf"
alias tupdate="tmux source-file $DOTFILES/tmux/tmux.conf"

# Alacritty Config
alias aedit="$EDITOR $DOTFILES/alacritty/alacritty.toml"

