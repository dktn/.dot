#!/bin/bash

. "install-lib.sh"

if [[ "$1" == "clean" ]]; then
    echo "Cleaning links..."
    rm_link ".zshrc"
    rm_link ".zshrc.common"
    rm_link ".tmux.conf"
    rm_link ".tmux-osx.conf"
    rm_link ".gitconfig"
    rm_link ".gitignore_global"
    rm_link ".fzf.zsh"
    rm_link ".ghci"
    rm_link ".stylish-haskell.yaml"
    rm_link ".hammerspoon"
else
    create_symlink     ".zshrc"
    create_symlink     ".zshrc.common"
    create_symlink     ".tmux.conf"
    create_symlink_osx ".tmux-osx.conf"
    create_symlink     ".gitconfig"
    create_symlink     ".gitignore_global"
    create_symlink     ".fzf.zsh"
    create_symlink     ".ghci"
    create_symlink     ".stylish-haskell.yaml"
    create_symlink_osx ".hammerspoon"
fi

echo "Done."
