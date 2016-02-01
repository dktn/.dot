#!/bin/bash

export DOT_DIR="$HOME/.dot"

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    export ST_DIR=".config/sublime-text-3"
elif [[ "$unamestr" == 'Darwin' ]]; then
    export ST_DIR="Library/Application Support/Sublime Text 3"
else
    echo "Not recognized system"
    exit -1
fi

echo "Creating links (tmux, zshrc, ghci, zsh_custom, gitconfig, hammerspoon)"

rm -f $HOME/.tmux.conf
ln -s $DOT_DIR/.tmux.conf $HOME/.tmux.conf

rm -f $HOME/.zshrc
ln -s $DOT_DIR/.zshrc $HOME/.zshrc

rm -f $HOME/.ghci
ln -s $DOT_DIR/.ghci $HOME/.ghci

rm -f $HOME/zsh_custom/themes/agnoster-dktn.zsh-theme
mkdir -p $HOME/zsh_custom/themes
ln -s $DOT_DIR/agnoster-dktn.zsh-theme $HOME/zsh_custom/themes/agnoster-dktn.zsh-theme

rm -f $HOME/.gitconfig $HOME/.gitignore_global
ln -s $DOT_DIR/.gitconfig $HOME/.gitconfig
ln -s $DOT_DIR/.gitignore_global $HOME/.gitignore_global

rm -rf $HOME/.hammerspoon
ln -s $DOT_DIR/.hammerspoon $HOME/.hammerspoon


export DOT_ST="sublime-text"
export ST_USER_DIR="$HOME/$ST_DIR/Packages/User"
export ST_PREFERENCES="Preferences.sublime-settings"
export ST_KEYMAP_OSX="Default (OSX).sublime-keymap"
export ST_KEYMAP_LINUX="Default (Linux).sublime-keymap"
export ST_STACK="Stack.sublime-build"
export ST_SOLAR="SolarizedToggle.sublime-settings"

echo "Creating Sublime Text links in $ST_USER_DIR"

rm -f "$ST_USER_DIR/$ST_PREFERENCES"
ln -s "$DOT_DIR/$DOT_ST/$ST_PREFERENCES" "$ST_USER_DIR/$ST_PREFERENCES"

rm -f "$ST_USER_DIR/$ST_KEYMAP_OSX"
ln -s "$DOT_DIR/$DOT_ST/$ST_KEYMAP_OSX" "$ST_USER_DIR/$ST_KEYMAP_OSX"

rm -f "$ST_USER_DIR/$ST_KEYMAP_LINUX"
ln -s "$DOT_DIR/$DOT_ST/$ST_KEYMAP_LINUX" "$ST_USER_DIR/$ST_KEYMAP_LINUX"

rm -f "$ST_USER_DIR/$ST_STACK"
ln -s "$DOT_DIR/$DOT_ST/$ST_STACK" "$ST_USER_DIR/$ST_STACK"

rm -f "$ST_USER_DIR/$ST_SOLAR"
ln -s "$DOT_DIR/$DOT_ST/$ST_SOLAR" "$ST_USER_DIR/$ST_SOLAR"


touch $HOME/.zshrc.local

echo "Done"
