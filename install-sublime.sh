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

export ST_PREFERENCES="Preferences.sublime-settings"
rm -f "$ST_USER_DIR/$ST_PREFERENCES"
ln -s "$DOT_ST/$ST_PREFERENCES" "$ST_USER_DIR/$ST_PREFERENCES"

export ST_KEYMAP="Default.sublime-keymap"
rm -f "$ST_USER_DIR/$ST_KEYMAP"
ln -s "$DOT_ST/$ST_KEYMAP" "$ST_USER_DIR/$ST_KEYMAP"

export ST_KEYMAP_OSX="Default (OSX).sublime-keymap"
rm -f "$ST_USER_DIR/$ST_KEYMAP_OSX"
ln -s "$DOT_ST/$ST_KEYMAP_OSX" "$ST_USER_DIR/$ST_KEYMAP_OSX"

export ST_KEYMAP_LINUX="Default (Linux).sublime-keymap"
rm -f "$ST_USER_DIR/$ST_KEYMAP_LINUX"
ln -s "$DOT_ST/$ST_KEYMAP_LINUX" "$ST_USER_DIR/$ST_KEYMAP_LINUX"

export ST_DOT="Dot.sublime-snippet"
rm -f "$ST_USER_DIR/$ST_DOT"
ln -s "$DOT_ST/$ST_DOT" "$ST_USER_DIR/$ST_DOT"

export ST_SOLAR="SolarizedToggle.sublime-settings"
rm -f "$ST_USER_DIR/$ST_SOLAR"
ln -s "$DOT_ST/$ST_SOLAR" "$ST_USER_DIR/$ST_SOLAR"

# export ST_STACK="Stack.sublime-build"
# rm -f "$ST_USER_DIR/$ST_STACK"
# ln -s "$DOT_ST/$ST_STACK" "$ST_USER_DIR/$ST_STACK"

# export ST_SUBLIME_HASKELL="SublimeHaskell.sublime-settings"
# rm -f "$ST_USER_DIR/$ST_SUBLIME_HASKELL"
# ln -s "$DOT_ST/$ST_SUBLIME_HASKELL" "$ST_USER_DIR/$ST_SUBLIME_HASKELL"

# export ST_SUB_HASKELL="Haskell-SublimeHaskell.sublime-settings"
# rm -f "$ST_USER_DIR/$ST_SUB_HASKELL"
# ln -s "$DOT_ST/$ST_SUB_HASKELL" "$ST_USER_DIR/$ST_SUB_HASKELL"

# export ST_SUB_HASKELL_DEF="Haskell-SublimeHaskell.tmLanguage"
# rm -f "$ST_PACK_DIR/SublimeHaskell/Syntaxes/$ST_SUB_HASKELL_DEF"
# ln -s "$DOT_ST/$ST_SUB_HASKELL_DEF" "$ST_PACK_DIR/SublimeHaskell/Syntaxes/$ST_SUB_HASKELL_DEF"

echo "Done"
