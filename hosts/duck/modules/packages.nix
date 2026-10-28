{ pkgs, ... }: {
  # Only system-level tools that must exist outside a home-manager profile.
  # User-facing apps live in home-manager/nixos/packages.nix.
  environment.systemPackages = with pkgs; [
    wget
    git
    alacritty
    tofi
    lsscsi
    cudatoolkit
    quickemu
  ];

  # Needed to run prebuilt x86-64 Linux binaries (steam-run-free).
  programs.nix-ld.enable = true;

  # Wayland-native rendering for Electron/Chromium apps.
  environment.variables.NIXOS_OZONE_WL = "1";

  environment.pathsToLink = [
    "/share/applications"
    "/share/xdg-desktop-portal"
  ];
}
