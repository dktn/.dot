#!/bin/bash

export DOT_DIR="$HOME/.dot"
export DOT_ST="sublime-text-2"

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

# Sublime Text 2
export ST_USER_DIR="$HOME/Library/Application Support/Sublime Text 2/Packages/User"
export ST_PREFERENCES="Preferences.sublime-settings"
export ST_KEYMAP="Default (OSX).sublime-keymap"
export ST_STACK="Stack.sublime-build"
export ST_SOLAR="SolarizedToggle.sublime-settings"

rm -f "$ST_USER_DIR/$ST_PREFERENCES"
ln -s "$DOT_DIR/$DOT_ST/$ST_PREFERENCES" "$ST_USER_DIR/$ST_PREFERENCES"

rm -f "$ST_USER_DIR/$ST_KEYMAP"
ln -s "$DOT_DIR/$DOT_ST/$ST_KEYMAP" "$ST_USER_DIR/$ST_KEYMAP"

rm -f "$ST_USER_DIR/$ST_STACK"
ln -s "$DOT_DIR/$DOT_ST/$ST_STACK" "$ST_USER_DIR/$ST_STACK"

rm -f "$ST_USER_DIR/$ST_SOLAR"
ln -s "$DOT_DIR/$DOT_ST/$ST_SOLAR" "$ST_USER_DIR/$ST_SOLAR"


touch $HOME/.zshrc.local
