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
      # Without this, one hand-edited dotfile that HM also manages aborts
      # activation with "existing file would be clobbered".
      home-manager.backupFileExtension = "backup";

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs; };
        users.noahj = import ../home-manager/darwin;
      };
    }
  ];
}
