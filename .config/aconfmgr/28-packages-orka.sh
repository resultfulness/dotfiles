if [ "$HOSTNAME" = "orka" ]; then
    AddPackage amd-ucode

    AddPackage nvidia-open
    AddPackage nvidia-settings
    AddPackage nvidia-utils
    AddPackage lib32-nvidia-utils
    AddPackage prismlauncher
    AddPackage steam
    AddPackage discord
    AddPackage --foreign discover-overlay
    AddPackage wine-staging
    AddPackage wine-mono
    AddPackage winetricks

    # virtualization
    AddPackage qemu-full
    AddPackage virt-manager
    AddPackage virt-viewer
    AddPackage bridge-utils
    AddPackage dmidecode
    AddPackage dnsmasq
    AddPackage openbsd-netcat
    AddPackage vde2
    AddPackage docker
    AddPackage docker-compose

    AddPackage moonlight-qt
    AddPackage --foreign sunshine-bin

    AddPackage --foreign cnijfilter2
    AddPackage simple-scan

    AddPackage android-tools
    AddPackage gimp
    AddPackage inkscape
    AddPackage mdbook
    AddPackage obs-studio
    AddPackage tenacity
fi
