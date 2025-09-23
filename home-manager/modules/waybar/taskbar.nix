{
  programs.waybar.settings.taskbar = {
    modules-center = [
      "wlr/taskbar"
    ];
    "wlr/taskbar" = {
      icon-size = 24;
      on-click = "activate";
      ignore-list = ["org.prismlauncher.PrismLauncher" "Minecraft* 1.18.2"];
    };
    height = 48;
    margin = "0 5 5 5";
    position = "bottom";
  };
}
