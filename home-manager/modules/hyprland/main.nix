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
	enabled = false;
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
	
