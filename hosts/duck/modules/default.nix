# duck's host modules, one file per subsystem. Listed in the same shape as
# home-manager/nixos/modules/default.nix so every module directory in the flake
# is imported the same way (`imports = [ ./modules ];`).
{
  imports = [
    ./agents.nix
    ./boot.nix
    ./desktop.nix
    ./filesystems.nix
    ./graphics.nix
    ./locale.nix
    ./networking.nix
    ./nix.nix
    ./packages.nix
    ./services.nix
    ./users.nix
  ];
}
