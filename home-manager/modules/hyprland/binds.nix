{ pkgs, ... }: {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mainMod, Space, exec, $menu"
      "$mainMod, C, killactive,"
      "$mainMod, M, exec, loginctl terminate-user ''"
      "CTRL+ALT+T, , exec, alacritty"
    ];
  };
}
