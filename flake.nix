{
  description = "Creator34's NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
  };

  outputs = { nixpkgs, home-manager, alacritty-theme, ... }: {
    nixosConfigurations = {
      duckbook = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
	  ./devices/duckbook/configuration.nix

	  ({ config, pkgs, ... }: {
	    nixpkgs.overlays = [ alacritty-theme.overlays.default ];
	  })

          home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;

	    home-manager.users.noahj = import ./home-manager/home.nix;
	  }
        ];
      };
      duck = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
	  ./devices/duck/configuration.nix

          home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;

	    home-manager.users.noahj = import ./home-manager/home.nix;
	  }
        ];
      };

    };
  };
}
