{ pkgs, ... }: {
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mainMod, Space, exec, $menu"
      "$mainMod, C, killactive,"
    ];
  };
}
