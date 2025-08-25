{pkgs, ...}:

{
    programs.waybar = {
        enable = true;
        package = pkgs.waybar;
        systemd.enable = true;
        settings = {
            main = {
                modules-right = ["privacy" "battery" "clock"];
                modules-center = ["hyprland/window"];
                modules-left = [ "hyprland/workspaces" "custom/gpu-usage" "memory" "cpu" "disk" ];
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
                        "^Discord \\| (.*)$" = "  $1";
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
                "battery" = {
                  format = "{capacity}% {icon}";
                  format-alt = "{time} {icon}";
                  format-charging = "{capacity}% ";
                  format-icons = [ "" "" "" "" "" ];
                  format-plugged = "{capacity}% ";
                  states = {
                    critical = 15;
                    warning = 30;
                  };
                };
            };
        };
        style = ./waybar.css;
    };
}
