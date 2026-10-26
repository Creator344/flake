{
  programs.umbriel.settings.keybinds = {
    # Applications
    "Ctrl+Alt+T" = "spawn:alacritty";
    "Mod+Space" = "spawn:noctalia msg panel-toggle launcher";
    "Mod+V" = "spawn:noctalia msg panel-toggle clipboard";
    "Mod+L" = "spawn:noctalia msg session lock";

    # Windows
    "Mod+F" = "window-toggle-floating";
    "Mod+Shift+M" = "window-toggle-maximize-to-edges";
    "Mod+Shift+F" = "window-toggle-fullscreen";
    "Mod+Shift+W" = "window-toggle-fullscreen";
    "Mod+C" = "window-close";

    # Overview and screenshot
    "Mod+S" = "overview-toggle";
    "Mod+Shift+S" = "spawn:noctalia msg screenshot-region";

    # Focus
    "Mod+Left" = "window-focus-left";
    "Mod+Right" = "window-focus-right";
    "Mod+Up" = "window-focus-up";
    "Mod+Down" = "window-focus-down";

    # Move windows and columns
    "Mod+Shift+Left" = "column-move-left";
    "Mod+Shift+Right" = "column-move-right";
    "Mod+Shift+Up" = "window-move-up";
    "Mod+Shift+Down" = "window-move-down";

    # Custom sound
    "Mod+Shift+C" = "spawn:aplay /home/noahj/something.wav";

    # AI scratchpad (named "ai" in default.nix) — off the workspace strip
    "Pause" = "scratchpad-toggle:ai";
    "Mod+Pause" = "window-move-to-scratchpad:ai";
    "Mod+Ctrl+Pause" = "window-restore-from-scratchpad:ai";

    # Workspace navigation
    "Mod+WheelDown" = "workspace-next";
    "Mod+WheelUp" = "workspace-previous";
    "Mod+Shift+WheelDown" = "column-move-to-workspace-next";
    "Mod+Shift+WheelUp" = "column-move-to-workspace-previous";
  };
}
