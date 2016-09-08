#!/bin/bash

export DOT_DIR="$HOME/.dot"
export OHMYZSH_DIR="$HOME/.oh-my-zsh/custom"

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    echo "Linux"
elif [[ "$unamestr" == 'Darwin' ]]; then
    echo "OS X" 
else
    echo "Not recognized system"
    exit -1
fi

echo "Creating links (tmux, zshrc, ghci, zsh_custom, gitconfig, hammerspoon, stylish-haskell)"

rm -f $HOME/.tmux.conf
ln -s $DOT_DIR/.tmux.conf $HOME/.tmux.conf
rm -f $HOME/.tmux-osx.conf
ln -s $DOT_DIR/.tmux-osx.conf $HOME/.tmux-osx.conf

rm -f $HOME/.zshrc
ln -s $DOT_DIR/.zshrc $HOME/.zshrc

rm -f $HOME/.ghci
ln -s $DOT_DIR/.ghci $HOME/.ghci

rm -f $OHMYZSH_DIR/themes/agnoster-dktn.zsh-theme
mkdir -p $OHMYZSH_DIR/themes
ln -s $DOT_DIR/oh-my-zsh-custom/agnoster-dktn.zsh-theme $OHMYZSH_DIR/themes/agnoster-dktn.zsh-theme

rm -rf $OHMYZSH_DIR/plugins/dircycle
mkdir -p $OHMYZSH_DIR/plugins/dircycle
ln -s $DOT_DIR/oh-my-zsh-custom/dircycle.plugin.zsh $OHMYZSH_DIR/plugins/dircycle/dircycle.plugin.zsh

rm -f $HOME/.gitconfig $HOME/.gitignore_global
ln -s $DOT_DIR/.gitconfig $HOME/.gitconfig
ln -s $DOT_DIR/.gitignore_global $HOME/.gitignore_global

rm -rf $HOME/.hammerspoon
ln -s $DOT_DIR/.hammerspoon $HOME/.hammerspoon

rm -rf $HOME/.stylish-haskell.yaml
ln -s $DOT_DIR/.stylish-haskell.yaml $HOME/.stylish-haskell.yaml

touch $HOME/.zshrc.local

echo "Done"
