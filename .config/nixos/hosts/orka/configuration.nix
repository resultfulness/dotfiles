{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "orka";

  # networking.wg-quick.interfaces.wg0 = {
  #   address = [ "10.165.224.31/24" ];
  #   listenPort = 51820;
  #   dns = [ "10.165.224.1" ];
  #   privateKeyFile = "/home/alice/.config/wireguard/orka.key";
  #   peers = [
  #     {
  #       publicKey = "NWfA/FnjvtxuXRpr/JDzPHCAxF8Ts1bNBlg0NAnxN2g=";
  #       allowedIPs = [ "10.165.224.0/24" ];
  #       endpoint = "192.168.0.111:51820";
  #       persistentKeepalive = 25;
  #     }
  #   ];
  # };

  users.users.alice.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [
    qbittorrent
    prismlauncher
  ];

  programs.steam.enable = true;

  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = false;
  };

  virtualisation.docker.enable = true;

  hardware.i2c.enable = true;
}
