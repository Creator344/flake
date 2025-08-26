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

      "$mainMod+SHIFT, 1, movetoworkspace, 1"
      "$mainMod+SHIFT, 2, movetoworkspace, 2"
      "$mainMod+SHIFT, 3, movetoworkspace, 3"
      "$mainMod+SHIFT, 4, movetoworkspace, 4"
      "$mainMod+SHIFT, 5, movetoworkspace, 5"
      "$mainMod+SHIFT, 6, movetoworkspace, 6"
      "$mainMod+SHIFT, 7, movetoworkspace, 7"
      "$mainMod+SHIFT, 8, movetoworkspace, 8"
      "$mainMod+SHIFT, 9, movetoworkspace, 9"
      "$mainMod+SHIFT, 0, movetoworkspace, 10"
    ];
  };
}
