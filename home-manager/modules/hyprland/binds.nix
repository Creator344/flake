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
      "$mainMod, E, exec, dolphin"
      "$mainMod+SHIFT, C, exec, hyprpicker"

      "$mainMod, 1, exec, hyprctl dispatch workspace 1"
      "$mainMod, 2, exec, hyprctl dispatch workspace 2"
      "$mainMod, 3, exec, hyprctl dispatch workspace 3"
      "$mainMod, 4, exec, hyprctl dispatch workspace 4"
      "$mainMod, 5, exec, hyprctl dispatch workspace 5"
      "$mainMod, 6, exec, hyprctl dispatch workspace 6"
      "$mainMod, 7, exec, hyprctl dispatch workspace 7"
      "$mainMod, 8, exec, hyprctl dispatch workspace 8"
      "$mainMod, 9, exec, hyprctl dispatch workspace 9"
      "$mainMod, 0, exec, hyprctl dispatch workspace 10"
    ];
  };
}
