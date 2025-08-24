{
  description = "Creator34's NixOS flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.05";
    };
    nixpkgs-unstable = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
  };

  outputs = {...}@inputs: {
    nixosConfigurations = {
      duckbook = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          (_: {
            nixpkgs.overlays = [inputs.alacritty-theme.overlays.default];
          })

          ./devices/duckbook/configuration.nix

          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.noahj = import ./home-manager/home.nix;
            };
          }
        ];
      };
      duck = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./devices/duck/configuration.nix

          (_: {
            nixpkgs.overlays = [inputs.alacritty-theme.overlays.default];
          })

          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.noahj = import ./home-manager/home.nix;
            };
          }
        ];
      };
    };
  };
}
