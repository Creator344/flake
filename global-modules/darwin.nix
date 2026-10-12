{ inputs, ... }:

{
  imports = [
    {
      nixpkgs.overlays = [
        inputs.alacritty-theme.overlays.default
      ];
    }

    inputs.nix-homebrew.darwinModules.nix-homebrew
    {
      nix-homebrew = {
        enable = true;
        enableRosetta = true;
        user = "noahj";
        taps = {
          "homebrew/homebrew-core" = inputs.homebrew-core;
          "homebrew/homebrew-cask" = inputs.homebrew-cask;
        };
      };
    }

    inputs.home-manager.darwinModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs; };
        users.noahj = import ../home-manager/darwin;
      };
    }
  ];
}
