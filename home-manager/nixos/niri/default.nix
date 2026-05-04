{ pkgs, osConfig, ... }:
{
  imports = [
    ./binds.nix
    ./startup.nix
    ./theme.nix
    ./window-rules.nix
    ./workspaces.nix
  ]
  ++ [ ./monitors/${toString osConfig.networking.hostName}.nix ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      input = {
        focus-follows-mouse.enable = true;
      };
      screenshot-path = null;
      prefer-no-csd = true;
    };
  };

  # Enable keyring
  services.gnome-keyring.enable = true;
}
