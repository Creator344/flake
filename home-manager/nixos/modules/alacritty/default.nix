{ lib, ... }:
{
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      window.opacity = lib.mkForce 0.8;
    };
  };
}
