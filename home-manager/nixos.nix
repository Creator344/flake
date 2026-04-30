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
    # AI
    opencode
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
    jdk25
    just
    nil
    ninja
    nixd
    nixfmt
    nixfmt-tree
    nvidia-container-toolkit
    prettierd
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
    # Python
    (python3.withPackages (
      p: with p; [
        pyqt6
      ]
    ))
    # System Configuration
    brightnessctl
    # System Info
    fastfetch
    pciutils
    powertop
    usbutils

    # Desktop Apps
    # 3D Modelling
    blender_5_0
    # Development
    jetbrains.datagrip
    zed-editor
    # Game Development
    godot
    # Games
    balatro-mod-manager
    heroic
    love
    mindustry-wayland
    prismlauncher
    millennium-steam
    shattered-pixel-dungeon
    # Games Modding
    r2modman
    # General
    pavucontrol
    qbittorrent
    # Media
    gimp
    handbrake
    kicad
    uxplay
    # Social
    element-desktop
    thunderbird-bin
    vesktop
    # Work
    obsidian

    # Niri
    xdg-desktop-portal-gnome
    gcr
    xdg-desktop-portal-gtk
    xwayland-satellite
    yad

    # Fonts
    nerd-fonts.geist-mono

    kdePackages.dolphin
  ];

  services.gnome-keyring.enable = true;

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
    settings = {
      user = {
        name = "Creator34";
        email = "98237272+Creator344@users.noreply.github.com";
      };
    };
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

  services.syncthing = {
    enable = true;
    settings = {
      devices = {
        "duckbook-pro" = {
          id = "FZ7VHHN-44BEWPF-J3RGNF5-FZWHBLL-URP44HN-OHVJQV5-TF2EIML-DJ54CAM";
        };
      };
      folders = {
        "mxrat-5fhnc" = {
          label = "Documents";
          path = "/home/noahj/Documents";
          devices = [ "duckbook-pro" ];
        };
        "jjvlc-rbkuk" = {
          label = "Prism Instances";
          path = "/drives/SSD_STORAGE/Prism\ Launcher/";
          devices = [ "duckbook-pro" ];
        };
      };
    };
  };

  home.stateVersion = "25.11";
}
