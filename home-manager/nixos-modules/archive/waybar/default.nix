{ pkgs, ... }:

{
  imports = [
    ./topbar.nix
    ./taskbar.nix
  ];

  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    style = ./waybar.css;
  };
}
