#!/bin/bash

. "install-lib.sh"

create_symlink     ".zshrc" ".zprezto"

create_symlink     ".tmux.conf"
create_symlink_osx ".tmux-osx.conf"
create_symlink     ".gitconfig"
create_symlink     ".gitignore_global"
create_symlink     ".fzf.zsh"
create_symlink     ".ghci"
create_symlink     ".stylish-haskell.yaml"
create_symlink_osx ".hammerspoon"

touch "$HOME/.zshrc.local"

echo "Done."
