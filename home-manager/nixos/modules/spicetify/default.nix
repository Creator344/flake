{ inputs, pkgs, ... }:

{
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblockify
        hidePodcasts
        shuffle
      ];
      theme = {
        name = "Comfy";
        src = pkgs.fetchFromGitHub {
          owner = "Comfy-Themes";
          repo = "Spicetify";
          rev = "main";
          hash = "sha256-sqvmSXJMLE2in/cB8ZIJE/t4J5D0PKRddWECdYJjgX0=";
        };
      };
    };
}
