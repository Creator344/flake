{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mainMod, Space, exec, $menu"
      "$mainMod, C, killactive,"
      "$mainMod, L, exec, hyprlock"
      "$mainMod, M, exec, loginctl terminate-user ''"
      "CTRL+ALT, T, exec, alacritty"
      "$mainMod, LEFT, swapwindow, l"
      "$mainMod, RIGHT, swapwindow, r"
      "$mainMod, UP, swapwindow, u"
      "$mainMod, DOWN, swapwindow, d"
      "$mainMod+SHIFT, S, exec, grim -g '$(slurp)' - | swappy -f -"
    ];
  };
}
