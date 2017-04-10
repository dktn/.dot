#!/bin/bash

. "install-lib.sh"

export LINK_LEN=70

create_symlink ".zshrc"     ".zprezto"
create_symlink ".zpreztorc" ".zprezto"
create_symlink ".zprezto/modules/prompt/functions/prompt_sorinx_setup"


echo "Done."
