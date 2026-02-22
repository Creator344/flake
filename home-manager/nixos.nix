{ inputs, pkgs, ... }:

{
  imports = [
    ./nixos-modules
    inputs.spicetify-nix.homeManagerModules.default
    inputs.niri.homeModules.niri
    inputs.noctalia.homeModules.default
  ];

  home = {
    username = "noahj";
    homeDirectory = "/home/noahj";
  };

  home.packages = with pkgs; [
    # CLI Apps
    # Audio
    alsa-utils
    # Clipboard
    cliphist
    wl-clipboard
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
    unstable.balatro-mod-manager
    heroic
    love
    mindustry-wayland
    prismlauncher
    millennium-steam
    unstable.shattered-pixel-dungeon
    # Games Modding
    r2modman
    # General
    kdePackages.dolphin
    pavucontrol
    qbittorrent
    unstable.quickshell
    # Media
    gimp
    handbrake
    kicad
    # Social
    vesktop
    # Work
    obsidian

    # Niri
    xdg-desktop-portal-gnome
    xwayland-satellite

    # Fonts
    nerd-fonts.geist-mono
  ];

  programs.floorp = {
    enable = true;
    package = pkgs.floorp-bin;
  };

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
      theme = {
        name = "Comfy";
        src = pkgs.fetchFromGitHub {
          owner = "Comfy-Themes";
          repo = "Spicetify";
          rev = "main";
          hash = "sha256-sqvmSXJMLE2in/cB8ZIJE/t4J5D0PKRddWECdYJjgX0=";
        };
      };
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
      general.import = [
        "~/.config/alacritty/themes/noctalia.toml"
      ];
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      window.opacity = 0.8;
    };
  };

  programs.atuin = {
    enable = true;
    settings = {
      search_mode = "fuzzy";
      enter_accept = true;
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
  home.stateVersion = "25.11";
}
