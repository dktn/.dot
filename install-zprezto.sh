#!/bin/bash

. "install-lib.sh"

export ZPREZTO_DIR=".zprezto"
export ZPREZTO_PROMPTS_DIR="$ZPREZTO_DIR/modules/prompt/functions"

export FULL_ZPREZTO_DIR="$HOME/$ZPREZTO_DIR"
if [ ! -d "$FULL_ZPREZTO_DIR" ]; then
    echo "Directory $FULL_ZPREZTO_DIR does not exist!"
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

if [[ "$1" == "clean" ]]; then
    echo "Cleaning links..."
    remove_prezto_links
else
    export LINK_LEN=70

    create_symlink ".zshrc"              "$ZPREZTO_DIR" "/"
    create_symlink ".zpreztorc"          "$ZPREZTO_DIR" "/"
    create_symlink ".zprezto.custom"     "$ZPREZTO_DIR" "/"
    create_symlink "prompt_sorinx_setup" "$ZPREZTO_PROMPTS_DIR"
fi

echo "Done."
