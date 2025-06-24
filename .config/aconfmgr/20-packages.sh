AddPackage --foreign aconfmgr-git
AddPackage stow

# system
AddPackage linux
AddPackage linux-firmware
AddPackage base
AddPackage base-devel
AddPackage git
AddPackage openssh
AddPackage cups
AddPackage pipewire
AddPackage pipewire-pulse
AddPackage otf-comicshanns-nerd
AddPackage noto-fonts-emoji
AddPackage noto-fonts-cjk
AddPackage --foreign yay
AddPackage --foreign kanata

# networking
AddPackage --foreign mullvad-vpn-bin
AddPackage openconnect
AddPackage tailscale
AddPackage wireguard-tools

# cli
AddPackage 7zip
AddPackage bluez
AddPackage bluez-utils
AddPackage bash-completion
AddPackage brightnessctl
AddPackage fzf
AddPackage imagemagick
AddPackage ghostscript
AddPackage jq
AddPackage htop
AddPackage yazi
AddPackage ueberzugpp
AddPackage --foreign dragon-drop
AddPackage man-db
AddPackage man-pages
AddPackage playerctl
AddPackage ripgrep
AddPackage socat
AddPackage starship
AddPackage tmux
AddPackage xdg-utils
AddPackage --foreign xdg-terminal-exec
AddPackage sshfs
# dev
AddPackage neovim
AddPackage lua-language-server
AddPackage rust-analyzer
AddPackage pnpm
AddPackage rustup
AddPackage nfs-utils
AddPackage smbclient
AddPackage syncthing

# graphical desktop
AddPackage --foreign hyprprop-git # xprop for Hyprland
AddPackage hyprland
AddPackage hyprlock
AddPackage hyprpaper
AddPackage hyprpicker
AddPackage hyprpolkitagent
AddPackage hyprsunset
AddPackage --foreign eww
AddPackage --foreign quickshell
AddPackage xdg-desktop-portal-gtk
AddPackage xdg-desktop-portal-hyprland
AddPackage adwaita-icon-theme
AddPackage rofi-wayland
AddPackage dunst
AddPackage nwg-look
AddPackage wl-clipboard
AddPackage grim
AddPackage slurp
AddPackage qt5-wayland

# gui
AddPackage alacritty
AddPackage amberol # Small and simple sound and music player that is well integrated with GNOME
AddPackage chromium
AddPackage file-roller
AddPackage keepassxc
AddPackage --foreign keepmenu
AddPackage ydotool
AddPackage libreoffice-still
AddPackage mpv
AddPackage nsxiv
AddPackage pavucontrol
AddPackage qbittorrent
AddPackage signal-desktop
AddPackage spotify-launcher
AddPackage --foreign zen-browser-bin


if [ "$HOSTNAME" = "orka" ]; then
    AddPackage amd-ucode

    AddPackage nvidia-open
    AddPackage nvidia-settings
    AddPackage nvidia-utils
    AddPackage lib32-nvidia-utils
    AddPackage prismlauncher
    AddPackage steam
    AddPackage --foreign vintagestory
    AddPackage wine-staging
    AddPackage wine-mono
    AddPackage winetricks

    AddPackage tenacity # An easy-to-use multi-track audio editor and recorder, forked from Audacity

    # virtualization
    AddPackage qemu-base
    AddPackage virt-manager
    AddPackage virt-viewer
    AddPackage bridge-utils
    AddPackage dmidecode
    AddPackage dnsmasq
    AddPackage openbsd-netcat
    AddPackage vde2

    # chromium screencast
    AddPackage protobuf
    AddPackage libmicrodns

    AddPackage cuda
    AddPackage moonlight-qt
    AddPackage --foreign sunshine

    AddPackage android-tools
    AddPackage gimp

    AddPackage --foreign cnijfilter2
    AddPackage simple-scan

    AddPackage mdbook
    AddPackage obs-studio
fi

if [ "$HOSTNAME" = "haai" ]; then
    AddPackage amd-ucode
fi
