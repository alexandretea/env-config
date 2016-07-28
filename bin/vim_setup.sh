#!/bin/bash

mkdir -p ~/.vim && mkdir -p ~/.vim/bundle

# formatting
echo "\" Formatting {

    set nowrap                      \" Do not wrap long lines
    set autoindent                  \" Indent at the same level of the previous line
    set shiftwidth=4                \" Use indents of 4 spaces
    set expandtab                   \" Tabs are spaces, not tabs
    set tabstop=4                   \" An indentation every four columns
    set softtabstop=4               \" Let backspace delete indent
    set nojoinspaces                \" Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  \" Puts new vsplit windows to the right of the current
    set splitbelow                  \" Puts new split windows to the bottom of the current
    \"set matchpairs+=<:>             \" Match, to be used with %
    set pastetoggle=<F12>           \" pastetoggle (sane indentation on pastes)
    \"set comments=sl:/*,mb:*,elx:*/  \" auto format comment blocks
    \" Remove trailing whitespaces and ^M chars
    \" To disable the stripping of whitespace, add the following to your
    \" .vimrc.before.local file:
    \"   let g:spf13_keep_trailing_whitespace = 1
    autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> if !exists('g:spf13_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
    \"autocmd FileType go autocmd BufWritePre <buffer> Fmt
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
    autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
    \" preceding line best in a plugin but here for now.

    autocmd BufNewFile,BufRead *.coffee set filetype=coffee

    \" Workaround vim-commentary for Haskell
    autocmd FileType haskell setlocal commentstring=--\ %s
    \" Workaround broken colour highlighting in Haskell
    autocmd FileType haskell,rust setlocal nospell

\" }" >> ~/.vimrc


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

# youcompleteme (code-completion engine)
# /!\ need the following packages:
# automake gcc gcc-c++ kernel-devel cmake python-devel python3-devel
git clone https://github.com/valloric/youcompleteme ~/.vim/bundle/youcompleteme \
    && cd ~/.vim/bundle/youcompleteme \
    && git submodule update --init --recursive \
    && ./install.py --all \
    && cd -

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
