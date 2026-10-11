{ config, ... }:
let
  c = config.lib.stylix.colors;
in
{
  programs.noctalia.settings.theme = {
    source = "custom";
    custom_palette = "stylix";
  };
}
