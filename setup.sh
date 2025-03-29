#!/bin/sh

config_dir=$XDG_CONFIG_HOME/dotfiles
home_config=$config_dir/home

for config in `ls $home_config/xdg_config`; do
	rm -f "$XDG_CONFIG_HOME/$config"
	ln -s "$home_config/xdg_config/$config" "$XDG_CONFIG_HOME/$config"
done

for script in `ls $home_config/scripts`; do
	ln -sf "$home_config/scripts/$script" ~/.local/bin/$script
done

ln -sf "$home_config/.bashrc" ~/.bashrc
ln -sf "$home_config/.profile" ~/.profile

rm "$XDG_PICTURES_DIR/wallpapers"
ln -sf "$home_config/wallpapers" "$XDG_PICTURES_DIR/wallpapers"
