{
  programs.waybar.settings.taskbar = {
    modules-center = [
      "wlr/taskbar"
    ];
    output = [
      "DP-3"
      "eDP-1"
    ];
    "wlr/taskbar" = {
      icon-size = 24;
    };
    height = 48;
    margin = "0 5 5 5";
    position = "bottom";
  };
}
