#!/bin/bash

export DOT_DIR="$HOME/.dot"

function show_system {
    unamestr=`uname`
    case $unamestr in
        'Linux')
            echo "Linux"
            ;;
        'Darwin')
            echo "OS X"
            ;;
        *)
            echo "Not recognized system."
            exit -1
            ;;
    esac
}

function rm_link {
    file="$HOME/$1"
    if [[ -L "$file" ]]; then
        echo "rm $file"
        rm "$file"
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
# $2 - source      directory (relative to DOT  dir) - defaults to ""
# $3 - destination directory (relative to HOME dir) - defaults to $2
function create_symlink {
    if [ ! -n "$1" ]; then
        echo "Parameters not provided. Exiting."
        exit -1
    fi
    src_file=$1
    tgt_file=$1
    src_dir=$2
    dst_dir=$3
    src="$DOT_DIR/$src_file"
    tgt="$HOME/$tgt_file"
    if [ -n "$src_dir" ]; then
        src="$DOT_DIR/$src_dir/$src_file"
        tgt="$HOME/$src_dir/$tgt_file"
    fi
    if [ -n "$dst_dir" ]; then
        tgt="$HOME/$tgt_file"
        if [ "$dst_dir" != "/" ]; then
            tgt="$HOME/$dst_dir/$tgt_file"
        fi
    fi
    len=40
    if [ -n "$LINK_LEN" ]; then
        len=$LINK_LEN
    fi
    printf "%14s %-*s -> %s\n" "Create symlink" $len "$tgt" "$src"
    rm -f "$tgt"
    ln -s "$src" "$tgt"
}

show_system
