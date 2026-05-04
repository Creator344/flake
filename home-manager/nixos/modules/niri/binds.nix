{
  programs.niri.settings.binds = {
    "Ctrl+Alt+T".action.spawn = [ "alacritty" ];
    "Mod+Space".action.spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "launcher"
      "toggle"
    ];
    "Mod+V".action.spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "launcher"
      "clipboard"
    ];
    "Mod+L".action.spawn = [
      "noctalia-shell"
      "ipc"
      "call"
      "lockScreen"
      "lock"
    ];
    "Mod+F".action.toggle-window-floating = [ ];
    "Mod+Shift+S".action.screenshot = [ ];
    "Mod+C".action.close-window = [ ];
    "Mod+S".action.toggle-overview = [ ];
    "Mod+Left".action.focus-column-left = [ ];
    "Mod+Down".action.focus-window-down = [ ];
    "Mod+Up".action.focus-window-up = [ ];
    "Mod+Right".action.focus-column-right = [ ];
    "Mod+Shift+C".action.spawn-sh = [
      "aplay /home/noahj/something.wav"
    ];
    "Mod+Shift+M".action.maximize-window-to-edges = [ ];
    "Mod+Shift+F".action.fullscreen-window = [ ];
    "Mod+Shift+W".action.toggle-windowed-fullscreen = [ ];
    "Mod+Shift+Left".action.move-column-left = [ ];
    "Mod+Shift+Down".action.move-window-down = [ ];
    "Mod+Shift+Up".action.move-window-up = [ ];
    "Mod+Shift+Right".action.move-column-right = [ ];
    "Mod+WheelScrollDown".action.focus-workspace-down = [ ];
    "Mod+WheelScrollUp".action.focus-workspace-up = [ ];
    "Mod+Shift+WheelScrollDown".action.move-column-to-workspace-down = [ ];
    "Mod+Shift+WheelScrollUp".action.move-column-to-workspace-up = [ ];
  };
}
