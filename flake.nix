{
  description = "Creator34's Nix flake";
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
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
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alacritty-theme = {
      url = "github:alexghr/alacritty-theme.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    millennium = {
      url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    blender-bin = {
      url = "github:edolstra/nix-warez/?dir=blender";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:4evy/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
      inputs.nix-darwin.follows = "nix-darwin";
    };
    umbriel = {
      url = "git+https://github.com/noctalia-dev/umbriel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zed = {
      url = "github:zed-industries/zed";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hermes-agent = {
      url = "github:NousResearch/hermes-agent";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    {
      nixpkgs,
      nix-darwin,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        duck = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./global-modules/nixos.nix
            ./hosts/duck/configuration.nix
          ];
        };
      };

      darwinConfigurations = {
        duckbook-pro = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = { inherit inputs; };
          modules = [
            ./global-modules/darwin.nix
            ./hosts/duckbook-pro/configuration.nix
          ];
        };
      };

      # `nix fmt` — one formatter both hosts can run, so formatting no longer
      # depends on the host having treefmt in its package list.
      formatter = {
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
        aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixfmt-tree;
      };
    };
}
