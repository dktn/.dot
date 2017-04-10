#!/bin/bash

export DOT_DIR="$HOME/.dot"

function show_system {
    unamestr=`uname`
    if [[ $unamestr == 'Linux' ]]; then
        echo "Linux"
    elif [[ $unamestr == 'Darwin' ]]; then
        echo "OS X"
    else
        echo "Not recognized system."
        exit -1
    fi
}

function ensure_dir {
    cr_dir="$HOME/$1"
    printf "%-14s %s\n" "Create dir" $cr_dir
    mkdir -p "$cr_dir"
}

function create_symlink_osx {
    if [[ "$unamestr" == 'Darwin' ]]; then
        create_symlink "$@"
    fi
}

function create_symlink_linux {
    if [[ "$unamestr" == 'Linux' ]]; then
        create_symlink "$@"
    fi
}

# $1 - source/dest file
# $2 - source      directory (relative to DOT  dir)
# $3 - destination directory (relative to HOME dir)
function create_symlink {
    if [ ! -n "$1" ]; then
        echo "Parameters not provided. Exiting."
        exit -1
    fi
    src_file=$1
    tgt_file=$1
    src="$DOT_DIR/$src_file"
    tgt="$HOME/$src_file"
    if [ -n "$2" ]; then
        src="$DOT_DIR/$2/$src_file"
    fi
    if [ -n "$3" ]; then
        tgt="$HOME/$3/$tgt_file"
    fi
    len=40
    if [ -n "$LINK_LEN" ]; then
        len=$LINK_LEN
    fi
    printf "%14s %-*s -> %s\n" "Create symlink" $len "$tgt" "$src"
    # rm -f "$tgt"
    # ln -s "$src" "$tgt"
}

show_system
