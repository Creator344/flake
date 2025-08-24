{pkgs, ...}:

{
    programs.waybar = {
        enable = true;
        package = pkgs.waybar;
        systemd.enable = true;
        settings = {
            main = {
                modules-right = ["privacy" "clock"];
                modules-left = ["hyprland/workspaces" "hyprland/window"];
                output = ["DP-3"];
                height = 36;
                margin = "5 5 0";
                "hyprland/window" = {
                    format = "{title}";
                    separate-outputs = true;
                    rewrite = {
                        "" = "󱄅 Phoenix";
                        "(.*) — Mozilla Firefox" = "󰈹  $1";
                        "(.*) - Visual Studio Code" = " $1";
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
            };
            second = {
                modules-center = ["cava" "mpd"];
                modules-left = ["hyprland/workspaces" "hyprland/window" ];
                modules-right = [ "custom/gpu-usage" "memory" "cpu" "disk"];
                output = ["HDMI-A-5"];
                height = 36;
                margin = "5 5 0";
                "hyprland/window" = {
                    format = "{title}";
                    separate-outputs = true;
                    rewrite = {
                        "" = "󱄅 Phoenix";
                        "(.*) — Mozilla Firefox" = "󰈹  $1";
                        "(.*) - Visual Studio Code" = "  $1";
                        "(.*) - Discord" = "  $1";
                        "Discord Updater" = "  Updating...";
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
                "custom/gpu-usage" = {
                    "exec" = "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits";
                    "format" = "󰡁 {}%";
                    "return-type" = "";
                    "interval" = 1;
                };
                "cava" = {
                    "bars" = 14;
                    "format-icons" =  ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
                    "bar_delimiter" = 0;
                };
            };
        };
        style = ./waybar.css;
    };
}
