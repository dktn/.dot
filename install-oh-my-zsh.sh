#!/bin/bash

. "install-lib.sh"

export LINK_LEN=70

export OH_MY_ZSH_DIR=".oh-my-zsh"
export OH_MY_ZSH_THEMES_DIR="$OH_MY_ZSH_DIR/custom/themes"
export OH_MY_ZSH_PLUGINS_DIR="$OH_MY_ZSH_DIR/custom/plugins"

ensure_dir                               "$OH_MY_ZSH_THEMES_DIR"
create_symlink "agnoster-dktn.zsh-theme" "$OH_MY_ZSH_THEMES_DIR"
ensure_dir                               "$OH_MY_ZSH_PLUGINS_DIR/dircycle"
create_symlink "dircycle.plugin.zsh"     "$OH_MY_ZSH_PLUGINS_DIR/dircycle"

create_symlink ".zshrc"                  "$OH_MY_ZSH_DIR"        "/"

echo "Done."
