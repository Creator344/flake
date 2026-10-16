{ pkgs, ... }:
{
  stylix = {
    enable = true;
    # nixpkgs options are disallowed by home-manager.useGlobalPkgs
    overlays.enable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";
    cursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 20;
    };
  };
}
