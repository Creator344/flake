{ pkgs, ... }:

{
  imports = [
    ./darwin-modules
  ];

  home = {
    username = "noahj";
    homeDirectory = "/Users/noahj";
    stateVersion = "25.11";
    packages = with pkgs; [
      # CLI Apps
      # Development
      bun
      cargo
      gh
      git
      just
      nil
      nixd
      nixfmt-tree
      prettierd
      python3
      rustc
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
      alacritty
      # Game Development
      love
      # Games
      prismlauncher
      unstable.shattered-pixel-dungeon
      # General
      qbittorrent
      # CAD Software
      # kicad
      # Social
      vesktop
      # Virtualisation
      colima
      docker
      docker-compose
      utm
      # Work
      obsidian

      # Web Apps
      # open-webui # dependency python3 accelerate broken as of 26/01/26

      nerd-fonts.geist-mono

    ];
  };
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
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
}
