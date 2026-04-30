{
  programs.niri.settings.layer-rules = [
    {
      matches = [ { namespace = "^noctalia-overview*"; } ];
      place-within-backdrop = true;
    }
  ];

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
        polkit-agent = {
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
        activeTemplates =
          map
            (id: {
              inherit id;
              enabled = true;
            })
            [
              "alacritty"
              "gtk"
              "qt"
              "kcolorscheme"
              "niri"
              "steam"
              "discord"
              "btop"
              "zed"
              "yazi"
              "spicetify"
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
