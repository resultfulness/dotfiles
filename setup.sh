#!/bin/sh

git submodule init
git submodule update

mkdir -p ~/.config
mkdir -p ~/.local/bin
sudo cp .config/kanata/kanata.kbd /etc/kanata.kbd

stow -vRt $HOME .
