white_list=(
    '/etc/kanata.kbd'
)
IgnoreRootPathsExcept "${white_list[@]}"

CreateLink /etc/kanata.kbd ~/.config/kanata/kanata.kbd

base
networking
cli
dev
gui
desktop

if [ "$HOSTNAME" == "orka" ]; then
    nvidia
    games
    sunshine
    # printer
    tex
    qemu
fi

AddPackage syncthing
AddPackage --foreign kanata
AddPackage --foreign xclicker
