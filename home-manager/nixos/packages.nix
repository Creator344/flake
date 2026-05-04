{ pkgs, ... }:
{
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
    # Storage
    qdirstat
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
}
