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

    # virtualization
    AddPackage qemu-base
    AddPackage virt-manager
    AddPackage virt-viewer
    AddPackage bridge-utils
    AddPackage dmidecode
    AddPackage dnsmasq
    AddPackage openbsd-netcat
    AddPackage vde2
    AddPackage docker
    AddPackage docker-compose

    AddPackage cuda
    AddPackage moonlight-qt
    AddPackage --foreign sunshine

    AddPackage --foreign cnijfilter2
    AddPackage simple-scan

    AddPackage android-tools
    AddPackage gimp
    AddPackage mdbook
    AddPackage obs-studio
    AddPackage tenacity
fi
