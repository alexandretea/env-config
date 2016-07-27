#!/bin/bash

mkdir -p ~/.vim && mkdir -p ~/.vim/bundle

# pathogen (useful to easily install vim plugins)
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# solarized color scheme
git clone git://github.com/altercation/vim-colors-solarized.git \
	~/.vim/bundle/vim-colors-solarized && echo "
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized" >> ~/.vimrc

# python
git clone https://github.com/klen/python-mode.git ~/.vim/bundle/python-mode && echo "
\" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on" >> ~/.vimrc
