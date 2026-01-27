{ inputs, pkgs, ... }:
let
  heliumBrowser = pkgs.callPackage ./modules/helium/default.nix { };
in
{
  imports = [
    ./modules
    inputs.spicetify-nix.homeManagerModules.default
  ];

  home = {
    username = "noahj";
    homeDirectory = "/home/noahj";
  };

  home.packages = with pkgs; [
    # CLI Apps
    # Development
    bun
    cargo
    cmake
    gcc
    gh
    unstable.jdk25
    just
    nil
    ninja
    nixd
    nixfmt-tree
    nixfmt-rfc-style
    nodePackages.vercel
    nvidia-container-toolkit
    prettierd
    python3
    p7zip
    rustc
    sqlite
    yaak
    # Files
    gawk
    gnupg
    gnused
    gnutar
    pandoc
    samba
    tree
    unzip
    which
    xz
    zip
    zstd
    # Misc
    cmatrix
    # Monitoring
    btop
    upower
    # Networking
    cloudflare-warp
    dig
    nmap
    # System Configuration
    brightnessctl
    # System Info
    fastfetch
    pciutils
    powertop
    usbutils

    # Desktop Apps
    # 3D Modelling
    unstable.blender
    # Development
    jetbrains.datagrip
    unstable.zed-editor
    # Game Development
    godot
    # Games
    heroic
    love
    mindustry-wayland
    prismlauncher
    steam
    unstable.shattered-pixel-dungeon
    # Games Modding
    r2modman
    # General
    heliumBrowser
    kdePackages.dolphin
    pavucontrol
    qbittorrent
    # Media
    handbrake
    kicad
    # Social
    vesktop
    # Work
    libreoffice
    obsidian
    teams-for-linux
    # 3D Printing
    bambu-studio

    # Fonts
    nerd-fonts.geist-mono

    # Hyprland
    # App Launcher
    tofi
    # Bars
    waybar
    # Clipboard
    clipse
    # Colour Picker
    hyprpicker
    # Compatibility
    gnome-network-displays
    # Desktop Background
    hyprpaper
    # Screenshots
    grimblast
  ];

  programs.starship = {
    enable = true;
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
      colorScheme = "Deeper";
    };

  # basic configuration of git
  programs.git = {
    enable = true;
    userName = "Creator34";
    userEmail = "98237272+Creator344@users.noreply.github.com";
  };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      general.import = [ pkgs.alacritty-theme.nightfox ];
      window.opacity = 0.8;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$HOME/.local/bin:$PATH"
      eval "$(starship init bash)"
    '';

    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };
  home.stateVersion = "25.05";
}
