{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../common.nix
  ];
  
  networking.firewall.allowedTCPPorts = [ 25565 5173 ];
  networking.firewall.allowedUDPPorts = [ 25565 ];

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
      unstable.vintagestory
      wine
      winetricks
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["alice"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}

