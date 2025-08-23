{
  config,
  lib,
  pkgs,
  ...
}: let
  # Define a wrapper script for Sway if needed for environment variables
  # or specific arguments for your Wayland compositor.
  # For a basic setup, you might directly call the compositor.
  swayRun = "${pkgs.sway}/bin/sway";
in {
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${lib.makeBinPath [pkgs.greetd.tuigreet]}/tuigreet --time --cmd ${swayRun}";
        # Optionally, specify a user for the greeter to run as.
        # user = "greeter";
      };
    };
  };

  # Ensure your Wayland compositor is enabled and configured if not already.
  programs.sway.enable = true;
}
