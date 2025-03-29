{ config, lib, pkgs, inputs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 22000 ];
  networking.firewall.allowedUDPPorts = [ 22000 21027 ];
  services.openssh.enable = true;
  services.resolved.enable = true;
  services.tailscale.enable = true;
  services.zerotierone = {
    enable = true;
    joinNetworks = [ "ebe7fbd445c277b3" ];
  };
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.cnijfilter2 ];

  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "en_US.UTF-8";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.libinput = { 
    enable = true;
    mouse.accelProfile = "flat";
    mouse.accelSpeed = "0.0";
    touchpad.naturalScrolling = true;
  };

  services.kanata = {
    enable = true;
    keyboards = {
      default = {
	config = ''
(defsrc
    caps
)

(deflayer base
    lctrl
)
	'';
      };
    };
  };

  users.users.alice = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    git
    alacritty
    rofi-wayland
    unstable.keepmenu
    keepassxc
    wl-clipboard
    hyprpicker
    hyprlock
    hyprshot
    hyprpaper
    brightnessctl
    playerctl
    nwg-look
    adwaita-icon-theme
    dunst
    pavucontrol
    unstable.signal-desktop
    libreoffice-qt6-fresh
    networkmanagerapplet
    openconnect
    lf
    neovim
    ripgrep
    fzf
    lua-language-server
    gcc
    file-roller
    p7zip
    inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins
    inputs.zen.packages."${pkgs.system}".default
  ];

  programs.hyprland.enable = true;
  programs.waybar.enable = true;
  programs.tmux.enable = true;
  programs.starship.enable = true;
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-media-tags-plugin
    thunar-volman
  ];
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  programs.xfconf.enable = true;

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "ComicShannsMono" ]; })
  ];

  xdg.terminal-exec.enable = true;
  programs.nix-ld.enable = true;

  system.stateVersion = "24.11";
}
