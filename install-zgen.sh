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

create_symlink "prompt_sorinx_setup" "$ZPREZTO_PROMPTS_DIR" ".zgen/sorin-ionescu/prezto-master/modules/prompt/functions"

# zsh
create_symlink ".zshrc" "$ZGEN_DIR" "/"

echo "Done."
