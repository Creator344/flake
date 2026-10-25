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

      # Persistent named workspace for AI/agent work. A name-based rule keeps it
      # around while empty on dynamic outputs, and `workspace-switch:AI` resolves
      # it by name (no quotes needed, "AI" is not all digits).
      workspace = [ { name = "AI"; } ];
    };
  };
}
