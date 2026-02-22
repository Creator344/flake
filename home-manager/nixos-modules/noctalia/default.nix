{
  programs.noctalia-shell = {
    enable = true;
    plugins = {
      sources = [
        {
          enabled = true;
          name = "Official Noctalia Plugins";
          url = "https://github.com/noctalia-dev/noctalia-plugins";
        }
      ];
      states = {
        tailscale = {
          enabled = true;
          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
        };
      };
      version = 2;
    };
    pluginSettings = {
      tailscale = {
        hideDisconnected = true;
        terminalCommand = "alacritty";
      };
    };
    systemd.enable = true;
    settings = {
      appLauncher.enableClipboardHistory = true;
      bar = {
        density = "comfortable";
        position = "top";
        showCapsule = false;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
              enableColorization = true;
              colorizeSystemIcon = "primary";
            }
          ];
          center = [
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "none";
            }
          ];
          right = [
            {
              id = "plugin:tailscale";
            }
            {
              id = "Tray";
            }
            {
              id = "Network";
            }
            {
              formatHorizontal = "HH:mm:ss";
              formatVertical = "HH mm ss";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
          ];
        };
      };
      colorSchemes = {
        useWallpaperColors = true;
        generationMethod = "faithful";
      };
      templates = {
        activeTemplates = [
          {
            enabled = true;
            id = "alacritty";
          }
          {
            enabled = true;
            id = "gtk";
          }
          {
            enabled = true;
            id = "qt";
          }
          {
            enabled = true;
            id = "kcolorscheme";
          }
          {
            enabled = true;
            id = "niri";
          }
          {
            enabled = true;
            id = "steam";
          }
          {
            enabled = true;
            id = "discord";
          }
          {
            enabled = true;
            id = "btop";
          }
          {
            enabled = true;
            id = "zed";
          }
          {
            enabled = true;
            id = "pywalfox";
          }
        ];
      };
      general = {
        avatarImage = "/home/noahj/PFP.png";
        radiusRatio = 0.2;
      };
      location = {
        monthBeforeDay = true;
        name = "Auckland, New Zealand";
      };
      wallpaper = {
        enabled = true;
        directory = "/home/noahj/flake/home-manager/nixos-modules/noctalia/wallpapers";
        viewMode = "single";
        setWallpaperOnAllMonitors = true;
        overviewEnabled = true;
      };
    };
  };
}
