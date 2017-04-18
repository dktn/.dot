#!/bin/bash

. "install-lib.sh"

unamestr=`uname`
case $unamestr in
    'Linux')
        export ST_DIR=".config/sublime-text-3"
        export LINK_LEN=86
        ;;
    'Darwin')
        export ST_DIR="Library/Application Support/Sublime Text 3"
        export LINK_LEN=96
        ;;
    *)
        echo "Can't localize Sublime Text 3 directory"
        exit -1
esac

export DOT_ST_DIR="sublime-text"
export ST_PACK_DIR="$ST_DIR/Packages"
export ST_USER_DIR="$ST_PACK_DIR/User"
export FULL_ST_USER_DIR="$HOME/$ST_USER_DIR"

if [ ! -d "$FULL_ST_USER_DIR" ]; then
    echo "Directory $FULL_ST_USER_DIR does not exist!"
    exit 1
fi

echo "Creating Sublime Text 3 links in $ST_USER_DIR"

create_symlink_osx   "Preferences.sublime-settings"            "$DOT_ST_DIR/osx"   "$ST_USER_DIR"
create_symlink_linux "Preferences.sublime-settings"            "$DOT_ST_DIR/linux" "$ST_USER_DIR"
create_symlink       "Default.sublime-keymap"                  "$DOT_ST_DIR"       "$ST_USER_DIR"
create_symlink       "Default (OSX).sublime-keymap"            "$DOT_ST_DIR"       "$ST_USER_DIR"
create_symlink       "Default (Linux).sublime-keymap"          "$DOT_ST_DIR"       "$ST_USER_DIR"
create_symlink       "Dot.sublime-snippet"                     "$DOT_ST_DIR"       "$ST_USER_DIR"
create_symlink       "SolarizedToggle.sublime-settings"        "$DOT_ST_DIR"       "$ST_USER_DIR"
create_symlink       "Elixir.sublime-settings"                 "$DOT_ST_DIR"       "$ST_USER_DIR"
create_symlink       "JSON.sublime-settings"                   "$DOT_ST_DIR"       "$ST_USER_DIR"

# create_symlink       "Stack.sublime-build"                     "$DOT_ST_DIR"       "$ST_USER_DIR"
# create_symlink       "SublimeHaskell.sublime-settings"         "$DOT_ST_DIR"       "$ST_USER_DIR"
# create_symlink       "Haskell-SublimeHaskell.sublime-settings" "$DOT_ST_DIR"       "$ST_USER_DIR"

# export ST_SUB_HASKELL_DEF="Haskell-SublimeHaskell.tmLanguage"
# rm -f "$ST_PACK_DIR/SublimeHaskell/Syntaxes/$ST_SUB_HASKELL_DEF"
# ln -s "$DOT_DIR/$DOT_ST_DIR/$ST_SUB_HASKELL_DEF" "$ST_PACK_DIR/SublimeHaskell/Syntaxes/$ST_SUB_HASKELL_DEF"

echo "Done."
