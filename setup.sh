#!/bin/sh

config_dir=$XDG_CONFIG_HOME/dotfiles
home_config=$config_dir/home

mkdir -p "$XDG_CONFIG_HOME"
for config in `ls $home_config/xdg_config`; do
	rm -f "$XDG_CONFIG_HOME/$config"
	ln -s "$home_config/xdg_config/$config" "$XDG_CONFIG_HOME/$config"
done

mkdir -p ~/.local/bin
for script in `ls $home_config/scripts`; do
	ln -sf "$home_config/scripts/$script" ~/.local/bin/$script
done

ln -sf "$home_config/.bashrc" ~/.bashrc
ln -sf "$home_config/.profile" ~/.profile

mkdir -p ~/pictures
rm -f ~/pictures/wallpapers
ln -sf "$home_config/wallpapers" ~/pictures/wallpapers
