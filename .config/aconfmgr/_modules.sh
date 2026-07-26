function base() {
    AddPackage linux
    AddPackage linux-firmware
    AddPackage base
    AddPackage base-devel
    AddPackage amd-ucode

    AddPackage git
    AddPackage stow

    AddPackage --foreign aconfmgr-git
    AddPackage --foreign yay
}

function networking() {
    AddPackage openssh
    AddPackage sshfs
    AddPackage networkmanager
    AddPackage wireguard-tools
    AddPackage openconnect
    AddPackage mullvad-vpn
}

function cli() {
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
    AddPackage --foreign dragon-drop
    AddPackage wiremix
    AddPackage htop
    AddPackage dust
}

function dev() {
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

    AddPackage godot
}

function gui() {
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
    AddPackage zathura
    AddPackage zathura-pdf-poppler
    AddPackage --foreign zen-browser-bin
}

function desktop() {
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

    AddPackage qt5-wayland
    AddPackage qt6-wayland

    AddPackage pipewire
    AddPackage pipewire-pulse

    AddPackage --foreign wlr-which-key
    AddPackage --foreign sunsetr-bin
    AddPackage --foreign alacritty-graphics
}

function nvidia() {
    AddPackage nvidia-open
    AddPackage nvidia-utils
    AddPackage lib32-nvidia-utils
}

function games() {
    AddPackage prismlauncher
    AddPackage steam
    AddPackage discord
    AddPackage --foreign discover-overlay
}

function sunshine() {
    AddPackage --foreign sunshine-bin
    AddPackage --foreign icu76
}

function printer() {
    AddPackage cups
    AddPackage --foreign cnijfilter2
}

function tex() {
    AddPackage texlive-basic
    AddPackage texlive-bibtexextra
    AddPackage texlive-binextra
    AddPackage texlive-context
    AddPackage texlive-fontsextra
    AddPackage texlive-fontsrecommended
    AddPackage texlive-fontutils
    AddPackage texlive-formatsextra
    AddPackage texlive-games
    AddPackage texlive-humanities
    AddPackage texlive-latex
    AddPackage texlive-latexextra
    AddPackage texlive-latexrecommended
    AddPackage texlive-luatex
    AddPackage texlive-mathscience
    AddPackage texlive-metapost
    AddPackage texlive-music
    AddPackage texlive-pictures
    AddPackage texlive-plaingeneric
    AddPackage texlive-pstricks
    AddPackage texlive-publishers
    AddPackage texlive-xetex
    AddPackage biber
    AddPackage texlive-langpolish
}

function qemu() {
    AddPackage dnsmasq
    AddPackage openbsd-netcat
    AddPackage qemu-base
    AddPackage qemu-chardev-spice
    AddPackage qemu-full
    AddPackage qemu-hw-display-virtio-gpu
    AddPackage qemu-hw-display-virtio-vga
    AddPackage qemu-hw-usb-redirect
    AddPackage spice
    AddPackage virt-manager
    AddPackage virt-viewer
}

# vim: foldmethod=marker foldmarker={,} foldlevel=0
