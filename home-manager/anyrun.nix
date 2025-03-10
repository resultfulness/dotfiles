{ pkgs, inputs, ... }:
{
  imports = [
    inputs.anyrun.homeManagerModules.default
  ];

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

}
