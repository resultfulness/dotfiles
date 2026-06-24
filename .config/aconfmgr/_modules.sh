function base() {
    AddPackage linux
    AddPackage linux-firmware
    AddPackage base
    AddPackage base-devel
    AddPackage amd-ucode

    AddPackage git
    AddPackage stow
}

function networking() {
    AddPackage openssh
    AddPackage sshfs
    AddPackage networkmanager
    AddPackage wireguard-tools
    AddPackage openconnect
    AddPackage mullvad-vpn
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
