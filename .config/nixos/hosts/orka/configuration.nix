{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "orka";
  networking.interfaces.enp10s0.wakeOnLan.enable = true;
  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "10.165.224.31/24" ];
      privateKeyFile = "/home/alice/.config/wireguard/orka.lan.key";
      peers = [
        {
          publicKey = "NWfA/FnjvtxuXRpr/JDzPHCAxF8Ts1bNBlg0NAnxN2g=";
          allowedIPs = [ "10.165.224.0/24" ];
          endpoint = "192.168.0.111:51820";
          persistentKeepalive = 25;
        }
      ];
    };
    wg1 = {
      address = [ "10.69.42.3/24" ];
      privateKeyFile = "/home/alice/.config/wireguard/orka.lancat.key";
      peers = [
        {
          publicKey = "8i2a9TP/jTtTOEZtOkuiMnC5+kL+vY5laeRqqGxJIR0=";
          allowedIPs = [ "10.69.42.0/24" ];
          endpoint = "192.168.33.10:51820";
          persistentKeepalive = 25;
        }
      ];
    };
  };

  services.resolved.dnsDelegates = {
    lan.Delegate = {
      DNS = [ "10.165.224.1" ];
      Domains = [ "lan" ];
    };
    lancat.Delegate = {
      DNS = [ "10.69.42.1" ];
      Domains = [ "lancat" ];
    };
  };

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
