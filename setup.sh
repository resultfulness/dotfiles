#!/bin/sh

git submodule init
git submodule update

mkdir -p ~/.config
mkdir -p ~/.local/bin

stow -vRt $HOME .
