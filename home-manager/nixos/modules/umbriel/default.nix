{
  imports = [
    ./binds.nix
  ];
  programs.umbriel = {
    enable = true;
    settings = {
      general = {
        autostart = [ "noctalia" ];
        show_cheatsheet = true;
      };
      layout.gap = 5;
      input.keyboard.layout = "nz";
    };
  };
}
