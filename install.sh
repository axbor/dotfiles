#!/bin/bash

DOTFILES=`pwd`

link() {
    FILE="$1"
    echo "$FILE"
    echo "${2:-$FILE}"
    SOURCE="${2:-$FILE}"
    echo /**
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
    echo "$SOURCE"
    echo "$TARGET"
}

link .vimrc
