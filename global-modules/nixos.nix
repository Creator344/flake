{ inputs, ... }:

{
  imports = [
    ({ pkgs, ... }: {
      nixpkgs.overlays = [
        inputs.blender-bin.overlays.default
        inputs.millennium.overlays.default
        inputs.zed.overlays.default
        # Rewire tools that hardcode a Nix reference so they use Lix too
        # (official recommendation from https://lix.systems/add-to-config)
        (_final: prev: {
          inherit (prev.lixPackageSets.lix_2_96)
            nixpkgs-review
            nix-eval-jobs
            nix-fast-build
            colmena
            nix-direnv
            ;
        })
      ];
      # Lix from nixpkgs (cached by cache.nixos.org), per
      # https://lix.systems/add-to-config — replaces the lix/lix-module
      # flake inputs, which are only meant for running Lix main.
      # lix_2_96 explicitly: the stable/latest aliases in nixpkgs still
      # point at 2.95; 2.96.0 is the current Lix stable (Oct 2026).
      nix.package = pkgs.lixPackageSets.lix_2_96.lix;
    })
    inputs.noctalia-greeter.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
    inputs.umbriel.nixosModules.default
    {
      # Without this, one hand-edited dotfile that HM also manages aborts
      # activation with "existing file would be clobbered".
      home-manager.backupFileExtension = "backup";

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs; };
        users.noahj = import ../home-manager/nixos;
      };
    }
    {
      # CUDA/OBS/blender closures fill the store fast; `just tidy` needed a human.
      nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
      };
      nix.optimise.automatic = true;
    }
  ];
}
