{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../common.nix
  ];

  networking.hostName = "orka";
  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn;
  };

  hardware.graphics.enable = true;
  hardware.nvidia = {
    nvidiaSettings = true;
    open = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;

  environment.systemPackages = with pkgs; [
      unstable.prismlauncher
      qbittorrent
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}

