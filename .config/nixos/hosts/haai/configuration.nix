{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "haai";

  users.users.alice.extraGroups = [ "networkmanager" ];

  hardware.graphics.enable = true;
  hardware.bluetooth.enable = true;
  services.upower.enable = true;
}
