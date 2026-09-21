{ config, lib, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.nix-ld.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "en_US.UTF-8";

  fonts.packages = with pkgs; [
    nerd-fonts.comic-shanns-mono
    nerd-fonts.noto
  ];

  users.users.alice = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    git
    stow

    adwaita-icon-theme

    starship
    p7zip
    unzip
    zip
    imagemagick
    brightnessctl
    playerctl
    xdg-utils
    jq
    bat
    fd
    fzf
    ripgrep
    ddcutil

    yazi
    dragon-drop
    wiremix

    unstable.neovim
    lua-language-server
    stylua
    tmux
    tree-sitter
    gcc
    direnv

    file-roller
    keepassxc
    libreoffice-qt
    hunspell
    hunspellDicts.pl_PL
    moonlight-qt
    mpv
    nsxiv
    unstable.signal-desktop
    tenacity
    zathura
    anki
    zen-browser
    (writeScriptBin "zen-browser" ''${zen-browser}/bin/zen-beta "$@"'')
    discord
    discover-overlay

    alacritty-graphics
    awww
    mako
    fuzzel
    quickshell
    socat
    wl-clipboard
    hyprlock
    hyprpicker
    grim
    slurp
    satty
    sunsetr
  ];

  services.sunshine.enable = true;

  services.syncthing = {
    enable = true;
    user = "alice";
    configDir = "/home/alice/.local/state/syncthing";
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  services.openssh.enable = true;

  services.kanata = {
    enable = true;
    keyboards = {
      default = {
        config = ''
          (defsrc caps)
          (deflayer base lctrl)
        '';
      };
    };
  };

  environment.etc.issue = lib.mkForce {
    source = pkgs.writeText "issue" ''
      [95malice's nixos linux-\r on \l[0m

    '';
  };

  system.stateVersion = "25.11";
}
