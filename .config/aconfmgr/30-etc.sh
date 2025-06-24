CopyFile /etc/locale.conf
CopyFile /etc/locale.gen
CreateLink /etc/localtime /usr/share/zoneinfo/Europe/Warsaw
CopyFile /etc/nsswitch.conf
CopyFile /etc/pacman.conf
CreateLink /etc/resolv.conf /run/systemd/resolve/stub-resolv.conf
CopyFile /etc/sudoers
CopyFile /etc/fuse.conf
