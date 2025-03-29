{
  description = "alice learns nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          (final: prev: {
            unstable = import nixpkgs-unstable {
              system = prev.system;
            };
          })
        ];
      };
    in {
      nixosConfigurations = {
        orka = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit pkgs; inherit inputs; };
          modules = [ ./nixos/orka/configuration.nix ];
        };
        haai = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit pkgs; inherit inputs; };
          modules = [ ./nixos/haai/configuration.nix ];
        };
      };
    };
}
