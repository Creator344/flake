{
  imports = [
    ./binds.nix
  ];
  programs.umbriel = {
    enable = true;
    settings = {
      general = {
        autostart = [ "noctalia" ];
        show_cheatsheet = false;
      };
      layout.gap = 5;
      input.keyboard.layout = "nz";
    };
  };
}
