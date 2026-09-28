#!/usr/bin/env bash

set -e

DOTFILES="$HOME/.dotfiles"

echo "Installing dotfiles from $DOTFILES"

backup_file() {
    local target="$1"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
        mv "$target" "$target.backup"
        echo "Backed up $target to $target.backup"
    fi
}

backup_file "$HOME/.bashrc"
backup_file "$HOME/.tmux.conf"

ln -sfn "$DOTFILES/bashrc" "$HOME/.bashrc"
ln -sfn "$DOTFILES/tmux.conf" "$HOME/.tmux.conf"

echo "Dotfiles installed successfully."
echo "Run: source ~/.bashrc"
