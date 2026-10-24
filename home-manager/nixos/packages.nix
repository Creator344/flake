{ pkgs, ... }:
{
  home.packages = with pkgs; [

    # ==========
    # CLI Apps
    # ==========

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
    maven
    nil
    ninja
    nixd
    nixfmt
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
    krename
    package-version-server
    pandoc
    samba
    tree
    unzip
    which
    xxdiff
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

    # ==========
    # GUI Apps
    # ==========

    # 3D Modelling
    blender_5_0
    # Development
    jetbrains.datagrip
    # Emails
    thunderbird
    # File Management
    krusader
    qdirstat
    # Game Development
    godot
    vinegar
    # Games
    balatro-mod-manager
    heroic
    love
    prismlauncher
    millennium-steam
    satisfactorymodmanager
    shattered-pixel-dungeon
    # Games Modding
    r2modman
    # General
    pavucontrol
    qbittorrent
    # iOS Sideloading
    iloader
    # Media
    aseprite
    gimp
    handbrake
    kicad
    uxplay
    # Social
    element-desktop
    # Virtualisation
    (bottles.override { removeWarningPopup = true; })
    virt-manager
    # Work
    obsidian

    # ==========
    # Other
    # ==========

    # Bash Addons
    blesh

    # Fonts
    nerd-fonts.geist-mono

    # Niri
    xdg-desktop-portal-gnome
    gcr_4
    xdg-desktop-portal-gtk
    xwayland-satellite
    yad
  ];
}
