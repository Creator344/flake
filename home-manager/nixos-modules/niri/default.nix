{ pkgs, ... }:
{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      spawn-at-startup = [
        { command = [ "vesktop" ]; }
      ];
      input = {
        focus-follows-mouse.enable = true;
      };
      binds = {
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
        "Mod+Shift+C".action.spawn-sh = [
          "aplay /home/noahj/something.wav"
        ];
        "Mod+C".action.close-window = [ ];
        "Mod+S".action.toggle-overview = [ ];
        "Mod+H".action.focus-column-left = [ ];
        "Mod+Left".action.focus-column-left = [ ];
        "Mod+J".action.focus-window-down = [ ];
        "Mod+Down".action.focus-window-down = [ ];
        "Mod+K".action.focus-window-up = [ ];
        "Mod+Up".action.focus-window-up = [ ];
        "Mod+L".action.focus-column-right = [ ];
        "Mod+Right".action.focus-column-right = [ ];
        "Mod+Shift+H".action.move-column-left = [ ];
        "Mod+Shift+Left".action.move-column-left = [ ];
        "Mod+Shift+J".action.move-window-down = [ ];
        "Mod+Shift+Down".action.move-window-down = [ ];
        "Mod+Shift+K".action.move-window-up = [ ];
        "Mod+Shift+Up".action.move-window-up = [ ];
        "Mod+Shift+L".action.move-column-right = [ ];
        "Mod+Shift+Right".action.move-column-right = [ ];
        "Mod+WheelScrollDown".action.focus-workspace-down = [ ];
        "Mod+WheelScrollUp".action.focus-workspace-up = [ ];
        "Mod+Shift+WheelScrollDown".action.move-column-to-workspace-down = [ ];
        "Mod+Shift+WheelScrollUp".action.move-column-to-workspace-up = [ ];
      };
      outputs = {
        "HDMI-A-1" = {
          mode = {
            width = 1920;
            height = 1080;
            refresh = 60.0;
          };
          scale = 1;
        };
      };
      window-rules = [
        {
          geometry-corner-radius =
            let
              radius = 12.0;
            in
            {
              top-left = radius;
              top-right = radius;
              bottom-left = radius;
              bottom-right = radius;
            };
          clip-to-geometry = true;
        }
        {
          matches = [
            { app-id = "^floorp$"; }
          ];
          open-on-workspace = "browser";
          open-maximized = true;
        }
        {
          matches = [
            { app-id = "^.zed-editor$"; }
          ];
          open-on-workspace = "coding";
          open-fullscreen = true;
        }
      ];
      layer-rules = [
        {
          matches = [ { namespace = "^noctalia-overview*"; } ];
          place-within-backdrop = true;
        }
      ];
      prefer-no-csd = true;
      workspaces = {
        "browser" = { };
        "coding" = { };
      };
    };
  };
}
