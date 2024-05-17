# my dotfiles

## installation

- install all the necessary dependencies

on arch linux
``` bash
sudo pacman -S git stow alacritty bspwm dunst neovim ripgrep fzf picom polybar sxhkd feh
  xorg-xsetroot xorg-setxkbmap polkit-gnome thunar thunar-volman gvfs thunar-archive-plugin
  xarchiver thunar-media-tags-plugin dmenu j4-dmenu-desktop xorg-xkill brightnessctl
  playerctl flameshot
```

- create directories so symlinks don't go crazy

```bash
mkdir -p ~/.config ~/.local/bin ~/.local/share
```

- clone this repo

```bash
git clone git@github.com:resultfulness/dotfiles.git ~/.dotfiles
```

- stow it out

```bash
cd ~/.dotfiles
stow .
```
