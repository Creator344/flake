{ inputs, ... }:

{
  imports = [
    ./modules

    ./packages.nix

    inputs.spicetify-nix.homeManagerModules.default
    inputs.noctalia.homeModules.default
    inputs.stylix.homeModules.stylix
    inputs.nixcord.homeModules.nixcord
    inputs.umbriel.homeModules.default
    inputs.hermes-agent.homeManagerModules.default
  ];

  home = {
    username = "noahj";
    homeDirectory = "/home/noahj";
    stateVersion = "25.11";
  };
}
