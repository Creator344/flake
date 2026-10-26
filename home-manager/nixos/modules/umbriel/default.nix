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

      # AI/agent surfaces live on a named scratchpad, not a workspace: Umbriel
      # has no hidden-workspace concept, so any workspace (persistent names
      # included) sits in the scroll strip. A scratchpad is the separate
      # surface — outside the workspace list, toggled rather than scrolled to.
      # Defining a named scratchpad removes the implicit "default" one.
      scratchpad = [ { name = "ai"; } ];
    };
  };
}
