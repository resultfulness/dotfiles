{
  description = "alice learns nixos";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags.url = "github:aylur/ags";
    zen.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, ... }@inputs:
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
          specialArgs = { inherit pkgs; };
          modules = [ ./nixos/orka/configuration.nix ];
        };
        haai = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit pkgs; };
          modules = [ ./nixos/haai/configuration.nix ];
        };
      };

      homeConfigurations."alice" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./home-manager/home.nix ];
      };
    };
}
