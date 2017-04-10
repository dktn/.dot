#!/bin/zsh

# Detect system
unamestr=`uname`
case $unamestr in
    'Linux')
        export FZF_BIN="/home/adam/.fzf/bin"
        export FZF_SHELL="/home/adam/.fzf/shell"
        ;;
    'Darwin')
        export FZF_BIN="/usr/local/opt/fzf/bin"
        export FZF_SHELL="/usr/local/opt/fzf/shell"
        ;;
    *)
        echo "Operating system $unamestr not supported."
        exit -1
        ;;
esac

# Setup fzf
# ---------
if [[ ! "$PATH" == "*$FZF_BIN*" ]]; then
    export PATH="$PATH:$FZF_BIN"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$FZF_SHELL/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$FZF_SHELL/key-bindings.zsh"


# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='rg --files'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export FZF_DEFAULT_OPTS='-e'

export FZF_ALT_C_COMMAND="find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' -o -name 'node_modules' -o -name '_build' -o -path '*/*\\.app' -o -name 'Library' -o -name 'deps' -o -name '.stack-work' \\) -prune -o -type d -print 2> /dev/null | cut -b3-"
