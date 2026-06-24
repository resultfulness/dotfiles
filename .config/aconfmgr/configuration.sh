IgnorePath '/*'

base
networking
tex
qemu

AddPackage bash-completion
AddPackage man-db
AddPackage man-pages
AddPackage starship

AddPackage 7zip
AddPackage unzip
AddPackage zip
AddPackage imagemagick
AddPackage ddcutil
AddPackage brightnessctl
AddPackage playerctl
AddPackage xdg-utils
AddPackage jq
AddPackage bat
AddPackage fd
AddPackage fzf
AddPackage ripgrep

AddPackage yazi
AddPackage wiremix
AddPackage htop

AddPackage neovim
AddPackage tree-sitter
AddPackage tree-sitter-cli
AddPackage tmux

AddPackage lua-language-server
AddPackage rust-analyzer
AddPackage svelte-language-server
AddPackage typescript-language-server
AddPackage pyright
AddPackage ruff
AddPackage vscode-css-languageserver
AddPackage vscode-html-languageserver

AddPackage stylua
AddPackage prettier

AddPackage pnpm
AddPackage rustup
AddPackage python-uv

AddPackage watchexec
AddPackage nix
AddPackage docker
AddPackage docker-compose

AddPackage niri
AddPackage xwayland-satellite
# AddPackage xdg-desktop-portal-gnome
# AddPackage xdg-desktop-portal-gtk
AddPackage awww
AddPackage fuzzel
AddPackage waybar
AddPackage mako
AddPackage wl-clipboard
AddPackage adwaita-icon-theme
AddPackage otf-comicshanns-nerd
AddPackage ttf-noto-nerd
AddPackage ttf-terminus-nerd
AddPackage noto-fonts-cjk
AddPackage noto-fonts-emoji
AddPackage swaylock
AddPackage swayidle

AddPackage hyprland

AddPackage pipewire
AddPackage pipewire-pulse

AddPackage file-roller
AddPackage keepassxc
AddPackage libreoffice-still
AddPackage libreoffice-still-pl
AddPackage moonlight-qt
AddPackage mpv
AddPackage nsxiv
AddPackage obsidian
AddPackage qbittorrent
AddPackage signal-desktop
AddPackage spotify-launcher
AddPackage gimp
AddPackage tenacity
AddPackage godot

AddPackage nvidia-open
AddPackage nvidia-utils
AddPackage lib32-nvidia-utils

AddPackage prismlauncher
AddPackage steam
AddPackage discord
AddPackage --foreign discover-overlay

# AddPackage cups
# AddPackage --foreign cnijfilter2

AddPackage syncthing

AddPackage --foreign aconfmgr-git
AddPackage --foreign sunsetr-bin
AddPackage --foreign alacritty-graphics
AddPackage --foreign dragon-drop
AddPackage --foreign kanata
AddPackage --foreign sunshine-bin
AddPackage --foreign icu76
AddPackage --foreign wlr-which-key
AddPackage --foreign yay
AddPackage --foreign zen-browser-bin

CreateLink /etc/kanata.kbd ~/.config/kanata/kanata.kbd
