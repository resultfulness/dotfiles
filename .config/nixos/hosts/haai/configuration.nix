{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "haai";

  networking.wg-quick.interfaces.wg0 = {
    address = [ "10.69.42.5/24" ];
    privateKeyFile = "/home/alice/.config/wireguard/haai.lancat.key";
    peers = [
      {
        publicKey = "8i2a9TP/jTtTOEZtOkuiMnC5+kL+vY5laeRqqGxJIR0=";
        allowedIPs = [ "10.69.42.0/24" ];
        endpoint = "192.168.33.10:51820";
        persistentKeepalive = 25;
      }
    ];
  };

  services.resolved.dnsDelegates.lancat.Delegate = {
    DNS = [ "10.69.42.1" ];
    Domains = [ "lancat" ];
  };

  users.users.alice.extraGroups = [ "networkmanager" ];

  hardware.graphics.enable = true;
  hardware.bluetooth.enable = true;
  services.upower.enable = true;
}
