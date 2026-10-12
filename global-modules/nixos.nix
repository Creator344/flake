{ inputs, ... }:

{
  imports = [
    {
      nixpkgs.overlays = [
        inputs.blender-bin.overlays.default
        inputs.millennium.overlays.default
      ];
    }
    inputs.lix-module.nixosModules.default
    inputs.noctalia-greeter.nixosModules.default
    inputs.home-manager.nixosModules.home-manager
    inputs.umbriel.nixosModules.default
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs; };
        users.noahj = import ../home-manager/nixos;
      };
    }
  ];
}
