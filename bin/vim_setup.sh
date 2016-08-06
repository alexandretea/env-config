#!/usr/bin/env bash

# Author:   Alexandre Tea <alexandre.qtea@gmail.com>
# File:     /Users/alexandretea/Work/Personal/kickstarters/bin/vim_setup.sh
# Purpose:  Set up my Vim environment
# Created:  2016-08-06 23:54:43
# Modified: 2016-08-06 23:55:29

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

declare -a files_paths=(
    "$BASEDIR/../config/vimrc"
    "$BASEDIR/../config/vimrc.bundles"
)
declare -a link_paths=(
    "~/.vimrc"
    "~/.vimrc.bundles"
)
clean=true

for i in `seq 0 $((${#link_paths[@]} - 1))`
do
    file=${files_paths[$i]}
    link_path=${link_paths[$i]}
    link_path="${link_path/#\~/$HOME}"
    if [ -f $link_path ] && [ "$1" != "--force" ]; then
        echo "Error: File '$link_path' already exists"
        clean=false
    else
        ln -sf $file $link_path
    fi
done

if ! $clean; then
    echo "Use --force to ignore and override existant files"
fi
