{pkgs, ...}:

{
    programs.waybar = {
        enable = true;
        package = pkgs.waybar;
        systemd.enable = true;
        settings = {
            main = {
                modules-right = ["privacy" "clock"];
                modules-center = ["cava"];
                modules-left = [ "hyprland/workspaces" "hyprland/window" "custom/gpu-usage" "memory" "cpu" "disk" ];
                output = ["DP-3" "eDP-1"];
                height = 36;
                margin = "5 5 0";
                "hyprland/window" = {
                    format = "{title}";
                    separate-outputs = true;
                    rewrite = {
                        "" = "󱄅";
                        "(.*) — Mozilla Firefox" = "󰈹  $1";
                        "(.*) - Zed" = " $1";
                        "(.*) - Discord" = "  $1";
                        "Discord Updater" = "  Updating...";
                        "Spotify Premium" = "󰓇 Spotify";
                    };
                };
                "hyprland/workspaces" = {
                    all-outputs = true;
                };
                "privacy" = {
                    	"ignore" = [
                            {
                                "type" = "audio-in";
                                "name" = "cava";
                            }
                        ];
                };
                "cava" = {
                    "bars" = 20;
                    "format-icons" =  ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
                    "bar_delimiter" = 0;
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
            };
        };
        style = ./waybar.css;
    };
}
