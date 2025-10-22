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
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";
  };

  outputs =
    { ... }@inputs:
    {
      nixosConfigurations = {
        duckbook = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            (_: {
              nixpkgs.overlays = [
                inputs.alacritty-theme.overlays.default
                (final: prev: {
                  unstable = import inputs.nixpkgs-unstable {
                    system = "x86_64-linux";
                    config.allowUnfree = true;
                  };
                })
              ];
            })

            ./hosts/duckbook/configuration.nix

            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.noahj = import ./home-manager/home.nix;
              };
            }
          ];
        };
        duck = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/duck/configuration.nix

            (_: {
              nixpkgs.overlays = [
                inputs.alacritty-theme.overlays.default
                (final: prev: {
                  unstable = import inputs.nixpkgs-unstable {
                    system = "x86_64-linux";
                    config.allowUnfree = true;
                  };
                })
              ];
            })

            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.noahj = import ./home-manager/home.nix;
              };
            }
          ];
        };
      };
    };
}
