{ pkgs, inputs, ... }:

{
  imports = [
    ./darwin-modules
    inputs.spicetify-nix.homeManagerModules.default
  ];

  home = {
    username = "noahj";
    homeDirectory = "/Users/noahj";
    stateVersion = "25.11";
    packages = with pkgs; [
      # CLI Apps
      # Development
      bun
      gh
      git
      just
      nil
      nixd
      nixfmt-tree
      prettierd
      python3
      rustup
      yaak
      # Files
      tree
      unzip
      which
      xz
      zip
      # Misc
      cmatrix
      # Monitoring
      btop
      # Networking
      dig
      nmap
      # System Info
      fastfetch
      usbutils

      # Desktop Apps
      # 3D Modelling
      # blender
      # Development
      jetbrains.datagrip
      # Game Development
      love
      # Games
      shattered-pixel-dungeon
      # General
      qbittorrent
      # Work
      obsidian

      nerd-fonts.geist-mono

    ];
  };

  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      font = {
        normal = {
          family = "Lilex Nerd Font";
          style = "Regular";
        };
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      general.import = [ pkgs.alacritty-theme.nightfox ];
      window = {
        decorations = "Buttonless";
        opacity = 0.8;
        padding = {
          x = 10;
          y = 10;
        };
      };
    };
  };

  programs.vesktop = {
    enable = true;
    package = pkgs.vesktop;
    settings = {
      discordBranch = "stable";
      transparencyOption = "none";
      tray = true;
      minimizeToTray = true;
      autoStartMinimized = true;
      openLinksWithElectron = false;
      staticTitle = false;
      enableMenu = false;
      disableSmoothScroll = false;
      hardwareAcceleration = true;
      hardwareVideoAcceleration = true;
      arRPC = true;
      appBadge = true;
      enableTaskbarFlashing = false;
      disableMinSize = true;
      clickTrayToShowHide = true;
      customTitleBar = false;

      enableSplashScreen = true;
      splashTheming = true;
    };
    vencord = {
      settings = {
        cloud = {
          authenticated = true;
          url = "https://api.vencord.dev/";
          settingsSync = true;
          settingsSyncVersion = 0;
        };
      };
    };
  };

  programs.floorp = {
    enable = true;
    policies = {
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
      };
    };
  };

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblockify
        hidePodcasts
        shuffle
      ];
      theme = spicePkgs.themes.sleek;
      colorScheme = "UltraBlack";
    };

  services.syncthing = {
    enable = true;
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      devices = {
        "duck" = {
          id = "45WTVCL-QVOJ7GI-ASNVZED-BXBUTBI-WLPGIXN-MPAXMKV-TZKHAEI-HYZECQB";
        };
      };
      folders = {
        "mxrat-5fhnc" = {
          label = "Documents";
          path = "/Users/noahj/Documents/";
          devices = [ "duck" ];
        };
        "jjvlc-rbkuk" = {
          label = "Prism Instances";
          path = "/Users/noahj/Library/Application Support/PrismLauncher/instances/";
          devices = [ "duck" ];
        };
      };
    };
  };
}
