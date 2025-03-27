{ config, pkgs, inputs, ... }:
let
  username = "alice";
  homeDirectory = "/home/${username}";
  dotfiles = config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/.config/dotfiles/home-manager/dotfiles";
in
{
  imports = [
    inputs.ags.homeManagerModules.default
    ./anyrun.nix
  ];

  home.username = username;
  home.homeDirectory = homeDirectory;
  home.stateVersion = "24.11";
  
  home.packages = with pkgs; [
    lf
    inputs.zen.packages."${pkgs.system}".default
    neovim
    ripgrep
    fzf
    lua-language-server
    gcc
    file-roller
    p7zip
  ];

  programs.ags = {
    enable = true;
    configDir = null;
    extraPackages = with inputs.ags.packages.${pkgs.system}; [
      battery
      mpris
      hyprland
      network
      wireplumber
      tray
    ];
  };

  home.file = {
    ".bashrc".source = "${dotfiles}/.bashrc";
    ".profile".text = ''
      . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
      . "$HOME/.bashrc"
    '';
    "${homeDirectory}/pictures/blahaj.png".source = "${dotfiles}/blahaj.png";
    ".local/bin" = {
      source = "${dotfiles}/scripts";
      recursive = true;
    };
  };
  xdg.configFile = {
    "alacritty/alacritty.toml".source = "${dotfiles}/alacritty/alacritty.toml";
    git.source = "${dotfiles}/git";
    hypr.source = "${dotfiles}/hypr";
    keepmenu.source = "${dotfiles}/keepmenu";
    nvim.source = "${dotfiles}/nvim";
    tmux.source = "${dotfiles}/tmux";
    waybar.source = "${dotfiles}/waybar";
  };

  xdg.userDirs = {
    enable = true;
    desktop = "";
    documents = "$HOME/documents";
    download = "$HOME/downloads";
    music = "$HOME/music";
    pictures = "$HOME/pictures";
    publicShare = "";
    templates = "";
    videos = "$HOME/videos";
  };

  gtk = {
    enable = true;
    gtk2.configLocation = "${config.home.sessionVariables.XDG_CONFIG_HOME}/gtk-2.0/gtkrc";
    gtk3.bookmarks = [
      "file://${homeDirectory}/documents/personal"
      "file://${homeDirectory}/documents/uni"
      "file://${homeDirectory}/games"
      "file://${homeDirectory}/documents"
      "file://${homeDirectory}/downloads"
      "file://${homeDirectory}/music"
      "file://${homeDirectory}/pictures"
      "file://${homeDirectory}/videos"
    ];
  };

  home.sessionVariables = {
    XDG_CONFIG_HOME = "${homeDirectory}/.config";
    XDG_DATA_HOME = "${homeDirectory}/.local/share";
    XDG_STATE_HOME = "${homeDirectory}/.local/state";
    XDG_CACHE_HOME = "${homeDirectory}/.cache";

    CUDA_CACHE_PATH = "${config.home.sessionVariables.XDG_CACHE_HOME}/nv";
    GOPATH = "${config.home.sessionVariables.XDG_DATA_HOME}/go";
    WINEPREFIX = "${config.home.sessionVariables.XDG_DATA_HOME}/wine";

    TERMINAL = "alacritty";
    BROWSER = "zen";
    EDITOR = "nvim";
    VISUAL = "nvim";

    NIXOS_OZONE_WL = "1";
  };

  services.syncthing = {
    enable = true;
  };

  programs.home-manager.enable = true;
}
