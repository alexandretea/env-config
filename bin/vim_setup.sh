#!/bin/bash

mkdir -p ~/.vim && mkdir -p ~/.vim/bundle

# pathogen (useful to easily install vim plugins)
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
	echo "
\" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on" >> ~/.vimrc

# solarized color scheme
git clone git://github.com/altercation/vim-colors-solarized.git \
	~/.vim/bundle/vim-colors-solarized && echo "
\" Solarized settings
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized" >> ~/.vimrc

# nerd tree (filesystem browsing)
git clone https://github.com/scrooloose/nerdtree ~/.vim/bundle/nerdtree

# nerd commenter
git clone https://github.com/scrooloose/nerdcommenter ~/.vim/bundle/nerdcommenter

# ctrlp (fuzzy file finder)
git clone https://github.com/kien/ctrlp.vim ~/.vim/bundle/ctrlp.vim

# syntastic (syntax checker)
git clone https://github.com/scrooloose/syntastic ~/.vim/bundle/syntastic

# vim-airline (custom status/tabline)
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline

# python
git clone https://github.com/klen/python-mode.git ~/.vim/bundle/python-mode
