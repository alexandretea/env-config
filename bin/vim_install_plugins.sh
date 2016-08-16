#!/usr/bin/env bash

# Author:   Alexandre Tea <alexandre.qtea@gmail.com>
# File:     /Users/alexandretea/Work/Personal/kickstarters/bin/vim_install_plugins.sh
# Purpose:  Install vim plugins using Pathogen
# Created:  2016-08-06 23:51:58
# Modified: 2016-08-16 11:56:13

# TODO snippet engine
# TODO describe blabla inspired from spf13 blabla

# function to install a plugin with pathogen
# first param is the git url, second is the settings
pathogen_install() {
    url=$1
    target_name=$(basename "$url")
    target_path=~/.vim/bundle/$target_name

    if [ -e $target_path ]; then
        echo "| Plugin '$target_name' is already installed"
    else
        echo "| Installing plugin '$target_name'"
        git clone "$url" "$target_path"
    fi
}

mkdir -p ~/.vim && mkdir -p ~/.vim/bundle && mkdir -p ~/.vim/snippets


# install pathogen (useful to easily install vim plugins)
target=~/.vim/autoload/pathogen.vim
if [ ! -e $target ]; then
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
        curl -LSso $target https://tpo.pe/pathogen.vim
else
    echo "| Pathogen is already installed"
fi


# Plugins installs
declare -a plugins=(
    "https://github.com/altercation/vim-colors-solarized"   # solarized colorscheme
    "https://github.com/scrooloose/nerdtree"                # filesystem browsing
    "https://github.com/scrooloose/nerdcommenter"           # easy comenting
    "https://github.com/kien/ctrlp.vim"                     # ctrlp (fuzzy file finder)
    "https://github.com/scrooloose/syntastic"               # syntastic (syntax checker)
    "https://github.com/bling/vim-airline"                  # vim-airline (custom status/tabline)
    "https://github.com/klen/python-mode"                   # python mode
    "https://github.com/terryma/vim-multiple-cursors"       # vim-multiple-cursor
    "https://github.com/tpope/vim-abolish"                  # search and substitute
    "https://github.com/vitalk/vim-shebang"                 # shebangs
    "https://github.com/ntpeters/vim-better-whitespace"     # highlights/strips trailing whitespaces
    "https://github.com/nathanaelkane/vim-indent-guides"    # show indent levels
    "https://github.com/townk/vim-autoclose"                # automatically closes ([{
    "https://github.com/mbbill/undotree"                    # undo tree, persistent undo
    "https://github.com/alexandretea/header.vim"            # file headers
    "https://github.com/bling/vim-bufferline"               # displays buffers in tagbar
)

for plugin in "${plugins[@]}"
do
    pathogen_install "$plugin"
done


# Manual installs

# youcompleteme (code-completion engine)
# /!\ need the following packages:
# automake gcc gcc-c++ kernel-devel cmake python-devel python3-devel
target=~/.vim/bundle/youcompleteme
if [ ! -e "$target" ]; then
git clone https://github.com/valloric/youcompleteme $target \
    && cd ~/.vim/bundle/youcompleteme \
    && git submodule update --init --recursive \
    && ./install.py --clang-completer \
    && cd -
else
    echo "| Plugin 'YouCompleteMe' is already installed"
fi
