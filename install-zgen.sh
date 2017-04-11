#!/bin/bash

. "install-lib.sh"

export ZGEN_DIR=".zgen"

export FULL_ZGEN_DIR="$HOME/$ZGEN_DIR"
if [ ! -d "$FULL_ZGEN_DIR" ]; then
    echo "Directory $FULL_ZGEN_DIR does not exist!"
    git clone https://github.com/tarjoilija/zgen.git "${HOME}/$ZGEN_DIR"
fi

# prezto
export ZPREZTO_DIR=".zprezto"
export ZPREZTO_PROMPTS_DIR="$ZPREZTO_DIR/modules/prompt/functions"

export LINK_LEN=70

ln_verbose "$FULL_ZGEN_DIR/sorin-ionescu/prezto-master" "${ZDOTDIR:-$HOME}/.zprezto"
create_symlink "prompt_sorinx_setup" "$ZPREZTO_PROMPTS_DIR"

# zsh
create_symlink ".zshrc"             "$ZGEN_DIR"    "/"
create_symlink ".zprezto.custom"    "$ZPREZTO_DIR" "/"


echo "Done."
