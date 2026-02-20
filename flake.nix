{
  description = "Creator34's NixOS flake";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.11";
    };
    nixpkgs-unstable = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
    nixpkgs-darwin = {
      url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    home-manager-nixos = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-darwin = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.6.0";
    stylix.url = "github:nix-community/stylix/release-25.11";
    niri.url = "github:sodiboo/niri-flake";
  };

  outputs =
    {
      nixpkgs,
      nix-darwin,
      nixpkgs-darwin,
      nix-homebrew,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        duckbook = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            inputs.stylix.nixosModules.stylix
            inputs.nix-flatpak.nixosModules.nix-flatpak
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

            inputs.home-manager-nixos.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.noahj = import ./home-manager/nixos.nix;
              };
            }
          ];
        };

        duck = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            inputs.stylix.nixosModules.stylix
            inputs.nix-flatpak.nixosModules.nix-flatpak
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

            inputs.home-manager-nixos.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.noahj = import ./home-manager/nixos.nix;
              };
            }
          ];
        };
      };

      darwinConfigurations = {
        duckbook-pro = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./hosts/duckbook-pro/configuration.nix

            (_: {
              nixpkgs.overlays = [
                inputs.alacritty-theme.overlays.default
                (final: prev: {
                  unstable = import inputs.nixpkgs-unstable {
                    system = "aarch64-darwin";
                    config.allowUnfree = true;
                  };
                })
              ];
            })

            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                enable = true;
                enableRosetta = true;
                user = "noahj";
              };
            }

            inputs.home-manager-darwin.darwinModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.noahj = import ./home-manager/darwin.nix;
              };
            }
          ];
        };
      };
    };
}
