#!/bin/bash

export DOT_DIR="$HOME/.dot"
export OHMYZSH_DIR="$HOME/.oh-my-zsh/custom"

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    export ST_DIR=".config/sublime-text-3"
elif [[ "$unamestr" == 'Darwin' ]]; then
    export ST_DIR="Library/Application Support/Sublime Text 3"
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

export DOT_ST="sublime-text"
export ST_PACK_DIR="$HOME/$ST_DIR/Packages"
export ST_USER_DIR="$ST_PACK_DIR/User"
export ST_PREFERENCES="Preferences.sublime-settings"
export ST_KEYMAP="Default.sublime-keymap"
export ST_KEYMAP_OSX="Default (OSX).sublime-keymap"
export ST_KEYMAP_LINUX="Default (Linux).sublime-keymap"
export ST_DOT="Dot.sublime-snippet"
export ST_STACK="Stack.sublime-build"
export ST_SOLAR="SolarizedToggle.sublime-settings"
export ST_SUBLIME_HASKELL="SublimeHaskell.sublime-settings"
export ST_SUB_HASKELL="Haskell-SublimeHaskell.sublime-settings"
export ST_SUB_HASKELL_DEF="Haskell-SublimeHaskell.tmLanguage"

echo "Creating Sublime Text links in $ST_USER_DIR"

rm -f "$ST_USER_DIR/$ST_PREFERENCES"
ln -s "$DOT_DIR/$DOT_ST/$ST_PREFERENCES" "$ST_USER_DIR/$ST_PREFERENCES"

rm -f "$ST_USER_DIR/$ST_KEYMAP"
ln -s "$DOT_DIR/$DOT_ST/$ST_KEYMAP" "$ST_USER_DIR/$ST_KEYMAP"

rm -f "$ST_USER_DIR/$ST_KEYMAP_OSX"
ln -s "$DOT_DIR/$DOT_ST/$ST_KEYMAP_OSX" "$ST_USER_DIR/$ST_KEYMAP_OSX"

rm -f "$ST_USER_DIR/$ST_KEYMAP_LINUX"
ln -s "$DOT_DIR/$DOT_ST/$ST_KEYMAP_LINUX" "$ST_USER_DIR/$ST_KEYMAP_LINUX"

rm -f "$ST_USER_DIR/$ST_DOT"
ln -s "$DOT_DIR/$DOT_ST/$ST_DOT" "$ST_USER_DIR/$ST_DOT"

rm -f "$ST_USER_DIR/$ST_STACK"
ln -s "$DOT_DIR/$DOT_ST/$ST_STACK" "$ST_USER_DIR/$ST_STACK"

rm -f "$ST_USER_DIR/$ST_SOLAR"
ln -s "$DOT_DIR/$DOT_ST/$ST_SOLAR" "$ST_USER_DIR/$ST_SOLAR"

rm -f "$ST_USER_DIR/$ST_SUBLIME_HASKELL"
ln -s "$DOT_DIR/$DOT_ST/$ST_SUBLIME_HASKELL" "$ST_USER_DIR/$ST_SUBLIME_HASKELL"

rm -f "$ST_USER_DIR/$ST_SUB_HASKELL"
ln -s "$DOT_DIR/$DOT_ST/$ST_SUB_HASKELL" "$ST_USER_DIR/$ST_SUB_HASKELL"

rm -f "$ST_PACK_DIR/SublimeHaskell/Syntaxes/$ST_SUB_HASKELL_DEF"
ln -s "$DOT_DIR/$DOT_ST/$ST_SUB_HASKELL_DEF" "$ST_PACK_DIR/SublimeHaskell/Syntaxes/$ST_SUB_HASKELL_DEF"


touch $HOME/.zshrc.local

echo "Done"
