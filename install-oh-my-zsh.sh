#!/bin/bash

. "install-lib.sh"

export LINK_LEN=70

create_symlink ".zshrc" ".oh-my-zsh"
ensure_dir     ".oh-my-zsh/custom/themes/"
create_symlink ".oh-my-zsh/custom/themes/agnoster-dktn.zsh-theme"
ensure_dir     ".oh-my-zsh/custom/plugins/dircycle/"
create_symlink ".oh-my-zsh/custom/plugins/dircycle/dircycle.plugin.zsh"

echo "Done."
