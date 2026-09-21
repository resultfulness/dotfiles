{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  networking.hostName = "haai";

  users.users.alice.extraGroups = [ "networkmanager" ];

  hardware.graphics.enable = true;
}
