{ config, pkgs, inputs, ... }:
let
  username = "alice";
  homeDirectory = "/home/${username}";
  dotfiles = config.lib.file.mkOutOfStoreSymlink "${homeDirectory}/.config/dotfiles/home-manager/dotfiles";
in
{
  imports = [
    inputs.ags.homeManagerModules.default
    inputs.anyrun.homeManagerModules.default
  ];

  home.username = username;
  home.homeDirectory = homeDirectory;
  home.stateVersion = "24.11";
  
  home.packages = with pkgs; [ lf ];

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
  programs.anyrun = {
    enable = true;
    config = {
      x.fraction = 0.5;
      y.absolute = 0;
      width.absolute = 800;
      height.absolute = 0;
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = false;
      showResultsImmediately = true;
      maxEntries = null;
    };
    config.plugins = with inputs.anyrun.packages.${pkgs.system}; [
      applications
      rink
      symbols
    ];
    extraCss = ''
#window {
  background-color: rgba(0, 0, 0, 0);
}

box#main {
  border-radius: 10px;
  background-color: @theme_bg_color;
}

list#main {
  background-color: rgba(0, 0, 0, 0);
  border-radius: 10px;
}

list#plugin {
  background-color: rgba(0, 0, 0, 0);
}

label#match-desc {
  font-size: 10px;
}

label#plugin {
  font-size: 14px;
}
    '';
  };

  home.file = {
    ".bashrc".source = "${dotfiles}/.bashrc";
    ".profile".text = ''
      . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
      . "$HOME/.bashrc"
    '';
    "${homeDirectory}/pictures/blahaj.png".source = "${dotfiles}/blahaj.png";
  };
  xdg.configFile = {
    "alacritty/alacritty.toml".source = "${dotfiles}/alacritty/alacritty.toml";
    git.source = "${dotfiles}/git";
    hypr.source = "${dotfiles}/hypr";
    keepmenu.source = "${dotfiles}/keepmenu";
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
      "file://${homeDirectory}/personal"
      "file://${homeDirectory}/uni"
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
    BROWSER = "firefox";
    EDITOR = "nvim";
    VISUAL = "nvim";

    NIXOS_OZONE_WL = "1";
  };

  services.syncthing = {
    enable = true;
  };

  programs.home-manager.enable = true;
}
