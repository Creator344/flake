{ pkgs, ... }:
{
  services.hyprpaper = {
    enable = true;
    package = pkgs.hyprpaper;
    settings = {
      preload = [
        "~/flake/home-manager/modules/hyprpaper/wallpapers/marek-piwnicki-kE1zeGSBJJk-unsplash-2colour-2.png"
      ];
      wallpaper = [
        "DP-3,~/flake/home-manager/modules/hyprpaper/wallpapers/marek-piwnicki-kE1zeGSBJJk-unsplash-2colour-2.png"
        "eDP-1,~/flake/home-manager/modules/hyprpaper/wallpapers/marek-piwnicki-kE1zeGSBJJk-unsplash-2colour-2.png"
      ];
    };
  };
}
