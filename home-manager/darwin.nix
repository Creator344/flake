{ pkgs, inputs, ... }:

{
  imports = [
    ./darwin-modules
    inputs.agenix.homeManagerModules.default
    inputs.nix-openclaw.homeManagerModules.openclaw
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
      unstable.shattered-pixel-dungeon
      # General
      qbittorrent
      # Social
      unstable.vesktop
      utm
      # Web Browser
      unstable.floorp-bin
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
