{
  description = "Creator34's Nix flake";
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
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
    blender-bin = {
      url = "github:edolstra/nix-warez/?dir=blender";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nix-darwin,
      nix-homebrew,
      ...
    }@inputs:
    let
      globalNixosModules = [
        {
          nixpkgs.overlays = [
            inputs.blender-bin.overlays.default
            inputs.millennium.overlays.default
            inputs.alacritty-theme.overlays.default
          ];
        }
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            users.noahj = import ./home-manager/nixos.nix;
          };
        }
      ];
      globalDarwinModules = [

      ];
    in
    {
      nixosConfigurations = {
        crapbook = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = globalNixosModules ++ [ ./hosts/crapbook/configuration.nix ];
        };

        duck = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = globalNixosModules ++ [ ./hosts/duck/configuration.nix ];
        };
      };

      darwinConfigurations = {
        duckbook-pro = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./hosts/duckbook-pro/configuration.nix

            {
              nixpkgs.overlays = [
                inputs.alacritty-theme.overlays.default
              ];
            }

            nix-homebrew.darwinModules.nix-homebrew
            {
              nix-homebrew = {
                enable = true;
                enableRosetta = true;
                user = "noahj";
              };
            }

            inputs.home-manager.darwinModules.home-manager
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
