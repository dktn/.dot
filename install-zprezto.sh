#!/bin/bash

. "install-lib.sh"

create_symlink ".zshrc"     ".zprezto"
create_symlink ".zpreztorc" ".zprezto"

echo "Done."
