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
AddPackage --foreign yay
AddPackage --foreign yay-debug
AddPackage --foreign aconfmgr-git
AddPackage --foreign kanata

# networking
AddPackage --foreign mullvad-vpn-bin
AddPackage openconnect
AddPackage tailscale
AddPackage zerotier-one

# cli
AddPackage 7zip
AddPackage bluez
AddPackage bluez-utils
AddPackage bash-completion
AddPackage brightnessctl
AddPackage fzf
AddPackage imagemagick
AddPackage lf
AddPackage man-db
AddPackage man-pages
AddPackage playerctl
AddPackage ripgrep
AddPackage starship
AddPackage tmux
AddPackage xdg-utils
AddPackage --foreign xdg-terminal-exec
# dev
AddPackage neovim
AddPackage lua-language-server
AddPackage pnpm
AddPackage rustup
AddPackage nfs-utils
AddPackage smbclient
AddPackage tcpdump


# graphical desktop
AddPackage hyprland
AddPackage hyprpaper
AddPackage hyprpicker
AddPackage hyprpolkitagent
AddPackage waybar
AddPackage --foreign flameshot-git # flameshot hyprland support
AddPackage xdg-desktop-portal-gtk
AddPackage xdg-desktop-portal-hyprland
AddPackage adwaita-icon-theme
AddPackage --foreign anyrun-git
AddPackage --foreign walker-bin
AddPackage libqalculate
AddPackage rofi-wayland
AddPackage dunst
AddPackage nwg-look
AddPackage wl-clipboard
AddPackage grim

# gui
AddPackage alacritty
AddPackage amberol # Small and simple sound and music player that is well integrated with GNOME
AddPackage chromium
AddPackage file-roller
AddPackage keepassxc
AddPackage --foreign keepmenu
AddPackage libreoffice-still
AddPackage mpv
AddPackage nsxiv
AddPackage pavucontrol
AddPackage qbittorrent
AddPackage signal-desktop
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
fi

if [ "$HOSTNAME" = "haai" ]; then
    AddPackage amd-ucode # Microcode update image for AMD CPUs
fi
