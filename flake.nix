{
  description = "Creator34's NixOS flake";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-nixos = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager-darwin = {
      url = "github:nix-community/home-manager";
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
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    niri.url = "github:sodiboo/niri-flake";
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
  };

  outputs =
    {
      nixpkgs,
      nix-darwin,
      nix-homebrew,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        # duckbook = nixpkgs.lib.nixosSystem {
        #   system = "x86_64-linux";
        #   modules = [
        #     inputs.nix-flatpak.nixosModules.nix-flatpak
        #     (_: {
        #       nixpkgs.overlays = [
        #         inputs.alacritty-theme.overlays.default
        #         (final: prev: {
        #           unstable = import inputs.nixpkgs-unstable {
        #             system = "x86_64-linux";
        #             config.allowUnfree = true;
        #           };
        #         })
        #       ];
        #     })

        #     ./hosts/duckbook/configuration.nix

        #     inputs.home-manager-nixos.nixosModules.home-manager
        #     {
        #       home-manager = {
        #         useGlobalPkgs = true;
        #         useUserPackages = true;
        #         extraSpecialArgs = { inherit inputs; };
        #         users.noahj = import ./home-manager/nixos.nix;
        #       };
        #     }
        #   ];
        # };

        crapbook = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            inputs.nix-flatpak.nixosModules.nix-flatpak
            (_: {
              nixpkgs.overlays = [
                inputs.millennium.overlays.default
                inputs.alacritty-theme.overlays.default
                (final: prev: {
                  unstable = import inputs.nixpkgs-unstable {
                    system = "x86_64-linux";
                    config.allowUnfree = true;
                  };
                })
              ];
            })

            ./hosts/crapbook/configuration.nix

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
            inputs.nix-flatpak.nixosModules.nix-flatpak
            ./hosts/duck/configuration.nix

            (_: {
              nixpkgs.overlays = [
                inputs.millennium.overlays.default
                inputs.alacritty-theme.overlays.default
                (final: prev: {
                  unstable = import inputs.nixpkgs {
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
