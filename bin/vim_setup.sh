#!/bin/bash

# script to setup my vim configuration

# function to install a plugin with pathogen
# first param is the git url, second is the settings
pathogen_install() {
    url=$1
    settings=$2
    target_name=$(basename "$url")
    target_path=~/.vim/bundle/$target_name

    if [ -e $target_path ]; then
        echo "| Plugin '$target_name' is already installed"
    else
        echo "| Installing plugin '$target_name'"
        git clone "$url" "$target_path"
        if [ ${#settings} -gt 0 ]; then
            echo "$settings" >> ~/.vimrc
        fi
    fi
}

mkdir -p ~/.vim && mkdir -p ~/.vim/bundle


# install pathogen (useful to easily install vim plugins)
target=~/.vim/autoload/pathogen.vim
if [ ! -e $target ]; then
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
        curl -LSso $target https://tpo.pe/pathogen.vim && \
        echo "
    \" Pathogen load
    filetype off

    call pathogen#infect()
    call pathogen#helptags()

    filetype plugin indent on
    syntax on" >> ~/.vimrc
else
    echo "| Pathogen is already installed"
fi


# install plugins without settings
declare -a plugins=(
"https://github.com/scrooloose/nerdtree"            # filesystem browsing
"https://github.com/scrooloose/nerdcommenter"       # easy comenting
"https://github.com/kien/ctrlp.vim"                 # ctrlp (fuzzy file finder)
"https://github.com/scrooloose/syntastic"           # syntastic (syntax checker)
"https://github.com/bling/vim-airline"              # vim-airline (custom status/tabline)
"https://github.com/klen/python-mode"               # python mode
"https://github.com/terryma/vim-multiple-cursors"   # vim-multiple-cursor
"https://github.com/tpope/vim-abolish"              # search and substitute
)

for plugin in "${plugins[@]}"
do
    pathogen_install "$plugin"
done


# install plugins with settings or specific installation

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

# solarized color scheme
pathogen_install "https://github.com/altercation/vim-colors-solarized" "
\" Solarized settings
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized"

# indent guides
pathogen_install "https://github.com/nathanaelkane/vim-indent-guides" "
\" Indent Guides settings
    \" indent_guides {
        if isdirectory(expand(\"~/.vim/bundle/vim-indent-guides/\"))
            let g:indent_guides_start_level = 2
            let g:indent_guides_guide_size = 1
            let g:indent_guides_enable_on_vim_startup = 1

            let g:indent_guides_auto_colors = 0
            autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
            autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey 
        endif
    \" }"
