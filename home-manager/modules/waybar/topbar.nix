{
  programs.waybar.settings.topbar = {
    modules-right = [
      "privacy"
      "battery"
      "clock"
    ];
    modules-center = [ "hyprland/window" ];
    modules-left = [
      "hyprland/workspaces"
      "memory"
      "cpu"
      "disk"
    ];
    output = [
      "DP-3"
      "eDP-1"
    ];
    height = 36;
    margin = "5 5 0 5";
    "hyprland/window" = {
      format = "{title}";
      separate-outputs = true;
      rewrite = {
        "" = "󱄅";
        "(.*) — Mozilla Firefox" = "󰈹  $1";
        "(.*) - Zed" = " $1";
        "^Discord \\| (.*)$" = "  $1";
        "Spotify Premium" = "󰓇 Spotify";
      };
    };
    "hyprland/workspaces" = {
      all-outputs = true;
    };
    "cpu" = {
      format = "  {usage}%";
    };
    "memory" = {
      format = "  {percentage}%";
    };
    "disk" = {
      format = "󰋊  {percentage_used}%";
    };
    "upower" = {
      icon-size = 20;
      hide-if-empty = true;
      tooltip = true;
    };
    "clock" = {
      format = "{:%H:%M:%S %a}";
      interval = 1;
    };
  };
}
