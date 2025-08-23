{
  description = "Creator34's NixOS flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.05";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alacritty-theme.url = "github:alexghr/alacritty-theme.nix";
    rose-pine-hyprcursor = {
      url = "github:ndom91/rose-pine-hyprcursor";
      inputs.nixpkgs.follows = "nixpkgs";
    };  
  };

  outputs = { self, ... }@inputs: {
    nixosConfigurations = {
      duckbook = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 

	  ({ config, pkgs, ... }: {

	    nixpkgs.overlays = [ inputs.alacritty-theme.overlays.default ];
	  
	  })

	  ./devices/duckbook/configuration.nix

          inputs.home-manager.nixosModules.home-manager
	  {
	    home-manager.useGlobalPkgs = true;
	    home-manager.useUserPackages = true;

	    home-manager.users.noahj = import ./home-manager/home.nix;
	  }
        ];
      };
      duck = inputs.nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ 
	  ./devices/duck/configuration.nix

	  ({ config, pkgs, ... }: {

            nixpkgs.overlays = [ inputs.alacritty-theme.overlays.default ];

          })

          inputs.home-manager.nixosModules.home-manager
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
