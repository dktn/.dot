#!/bin/bash

. "install-lib.sh"

export ZPLUG_DIR=".zplug"
export ZPLUG_HOME="$HOME/$ZPLUG_DIR"

if [ ! -d "$ZPLUG_HOME" ]; then
    echo "Directory $ZPLUG_HOME does not exist!"
    git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi

# prezto
export ZPREZTO_DIR=".zprezto"
export ZPREZTO_PROMPTS_DIR="$ZPREZTO_DIR/modules/prompt/functions"

export LINK_LEN=70

ln_verbose "$ZPLUG_HOME/repos/sorin-ionescu/prezto" "${ZDOTDIR:-$HOME}/.zprezto"
create_symlink "prompt_sorinx_setup" "$ZPREZTO_PROMPTS_DIR"

# zsh
create_symlink ".zshrc"             "$ZPLUG_DIR"   "/"
create_symlink ".zprezto.custom"    "$ZPREZTO_DIR" "/"

echo "Done."
