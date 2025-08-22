{ pkgs, ... }:
{
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/moonlight.yaml";
    image = ./wallpapers/marek-piwnicki-kE1zeGSBJJk-unsplash-2colour-2.png;
    fonts = {
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;
      
      monospace = {
	package = pkgs.nerd-fonts.geist-mono;
	name = "Geist Mono Nerd Font";
      };
    };
  };
}
