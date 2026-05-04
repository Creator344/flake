{
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      general.import = [
        "~/.config/alacritty/themes/noctalia.toml"
      ];
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      window.opacity = 0.8;
    };
  };
}