#!/bin/bash

DOTFILES=`pwd`

link() {
    FILE="$1"
    SOURCE="${2:-$FILE}"
    if [[ ! $SOURCE == /** ]]; then
        SOURCE="$HOME/$FILE"
    fi

    TARGET="$DOTFILES/$FILE"

    #Check if $SOURCE is a symlink
    if [ -L "$SOURCE" ]; then
        echo " file $FILE is already linked"
    elif [ -e "$SOURCE" ]; then
        echo "ERROR, file $FILE exists but is not a link!"
    else
        echo "linking $TARGET"
        ln -s "$TARGET" "$SOURCE"
    fi
}

link .vimrc
link .bashrc
link .bash_profile
link .bash_aliases
link .byobu
link .gitconfig


# Adding Vundle for vim
if [[ "$*" == *"--vundle"* ]]; then
    echo "Installing vim vundle plugins"
    if ! [ -d ~/.vim/bundle/vundle ]; then
        git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    fi
    vim +PluginInstall +qall
    echo "Plugins installed!"
else
    echo "Not installing vim vundle plugins, run with --vundle to enable"
fi
