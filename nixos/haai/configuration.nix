{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../common.nix
  ];

  networking.hostName = "haai";

  services.zerotierone = {
    enable = true;
    joinNetworks = [ "ebe7fbd445c277b3" ];
  };

  environment.systemPackages = with pkgs; [
    openconnect
  ];
}

