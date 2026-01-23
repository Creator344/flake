{ pkgs, lib, ... }:

{
  home = {
    username = "noahj";
    homeDirectory = "/Users/noahj";
    stateVersion = "25.11";
    packages = with pkgs; [
      git
    ];
  };
}
