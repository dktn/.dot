#!/bin/bash

export DOT_DIR="$HOME/.dot"

unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
    echo "Linux"
    export ST_DIR=".config/sublime-text-3"
elif [[ "$unamestr" == 'Darwin' ]]; then
    echo "OS X"
    export ST_DIR="Library/Application Support/Sublime Text 3"
else
    echo "Not recognized system"
    exit -1
fi

export DOT_ST="$DOT_DIR/sublime-text"
export ST_PACK_DIR="$HOME/$ST_DIR/Packages"
export ST_USER_DIR="$ST_PACK_DIR/User"

echo "Creating Sublime Text 3 links in $ST_USER_DIR"

function create_sublime_symlink {
    echo "Create symlink $ST_USER_DIR/$1 -> $DOT_ST/$1"
    rm -f "$ST_USER_DIR/$1"
    ln -s "$DOT_ST/$1" "$ST_USER_DIR/$1"
}

create_sublime_symlink "Preferences.sublime-settings"
create_sublime_symlink "Default.sublime-keymap"
create_sublime_symlink "Default (OSX).sublime-keymap"
create_sublime_symlink "Default (Linux).sublime-keymap"
create_sublime_symlink "Dot.sublime-snippet"
create_sublime_symlink "SolarizedToggle.sublime-settings"

# create_sublime_symlink "Stack.sublime-build"
# create_sublime_symlink "SublimeHaskell.sublime-settings"
# create_sublime_symlink "Haskell-SublimeHaskell.sublime-settings"

# export ST_SUB_HASKELL_DEF="Haskell-SublimeHaskell.tmLanguage"
# rm -f "$ST_PACK_DIR/SublimeHaskell/Syntaxes/$ST_SUB_HASKELL_DEF"
# ln -s "$DOT_ST/$ST_SUB_HASKELL_DEF" "$ST_PACK_DIR/SublimeHaskell/Syntaxes/$ST_SUB_HASKELL_DEF"

echo "Done"