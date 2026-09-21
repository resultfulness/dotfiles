{
  description = "alice system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs:
    let
      system = "x86_64-linux";
      nixpkgs-config = {
        nixpkgs.overlays = [
          (final: prev: {
            zen-browser = inputs.zen-browser.packages.${system}.default;
            unstable = import nixpkgs-unstable { inherit system; };
          })
        ];
        nixpkgs.config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations = {
        orka = nixpkgs.lib.nixosSystem {
          modules = [
            ./common.nix
            ./hosts/orka/configuration.nix
            nixpkgs-config
          ];
        };
        haai = nixpkgs.lib.nixosSystem {
          modules = [
            ./common.nix
            ./hosts/haai/configuration.nix
            nixpkgs-config
          ];
        };
      };
    };
}
