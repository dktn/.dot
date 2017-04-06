#!/bin/bash

export DOT_DIR="$HOME/.dot"

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    echo "Linux"
elif [[ "$unamestr" == 'Darwin' ]]; then
    echo "OS X"
else
    echo "Not recognized system"
    exit -1
fi

function create_symlink {
    if [ -n "$2" ]
    then
        echo "Create dir     $HOME/$2"
        mkdir -p "$HOME/$2"
    fi
    echo "Create symlink $HOME/$2$1 -> $DOT_DIR/$2$1"
    rm -f "$HOME/$2$1"
    ln -s "$DOT_DIR/$2$1" "$HOME/$2$1"
}

create_symlink ".tmux.conf"
create_symlink ".tmux-osx.conf"
create_symlink ".zshrc.conf"
create_symlink ".gitconfig"
create_symlink ".gitignore_global"
create_symlink ".fzf.zsh"
create_symlink ".ghci"
create_symlink ".hammerspoon"
create_symlink ".stylish-haskell.yaml"
create_symlink "agnoster-dktn.zsh-theme" ".oh-my-zsh/custom/themes/"
create_symlink "dircycle.plugin.zsh"     ".oh-my-zsh/custom/plugins/dircycle/"

touch $HOME/.zshrc.local

echo "Done"
