{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {
      monitor = ",preferred,auto,1";
      "$mainMod" = "SUPER";
      "$terminal" = "alacritty";
      "$fileManager" = "dolphin";
      "$menu" = "tofi-drun | xargs hyprctl dispatch exec --";

      exec-once = [
	"mako"
	"hyprpaper"
	"firefox"
	"waybar"
      ];

      environment.sessionVariables.NIXOS_OZONE_WL = "1";
      environment.sessionVariables.LIBVA_DRIVER_NAME = "nvidia";
      environment.sessionVariables.__GLX_VENDOR_LIBRARY_NAME = "nvidia";

      general = {
	gaps_in = 5;
	gaps_out = 10;
	
	border-size = 4;

	"col.active_border" = "rgba(139cffee) rgba(c144ffee) 45deg";
	"col.inactive_border" = "rgba(595959aa)";

	resize_on_border = true;

	allow_tearing = false;

	layout = "dwindle";
      };

      decoration = {
	rounding = 12;
	rounding_power = 3;
	
	active_opacity = 1.0;
	inactive_opacity = 1.0;

	shadow = {
	  enabled = true;
	  size = 3;
	  passes = 1;
	  
	  vibrancy = 0.1696;
	};
      };

      animations = {
	enabled = true;

    	# Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
	bezier = [
          "easeOutQuint,0.23,1,0.32,1"
	  "easeInOutCubic,0.65,0.05,0.36,1"
	  "linear,0,0,1,1"
	  "almostLinear,0.5,0.5,0.75,1.0"
	  "quick,0.15,0,0.1,1"
        ];

	animation = [
	  "global, 1, 10, default"
	  "border, 1, 5.39, easeOutQuint"
	  "windows, 1, 4.79, easeOutQuint"
	  "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
	  "windowsOut, 1, 1.49, linear, popin 87%"
	  "fadeIn, 1, 1.73, almostLinear"
	  "fadeOut, 1, 1.46, almostLinear"
	  "fade, 1, 3.03, quick"
	  "layers, 1, 3.81, easeOutQuint"
	  "layersIn, 1, 4, easeOutQuint, fade"
	  "layersOut, 1, 1.5, linear, fade"
	  "fadeLayersIn, 1, 1.79, almostLinear"
	  "fadeLayersOut, 1, 1.39, almostLinear"
	  "workspaces, 1, 1.94, almostLinear, fade"
	  "workspacesIn, 1, 1.21, almostLinear, fade"
	  "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      input = {
	kb_layout = "us";
      };

      gestures = {
	workspace_swipe = true;
	workspace_swipe_invert = false;
	workspace_swipe_forever = true;
      };

      dwindle = {
	psuedotile = true;
	preserve_split = true;
      };

      master = {
	new_status = "master";
      };

      misc = {
	force_default_wallpaper = 0;
	disable_hyprland_logo = true;
      };

      windowrule = [
	"suppressevent maximise, class:.*"
	"nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };
}
	
