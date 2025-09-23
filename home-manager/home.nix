{ inputs, pkgs, ... }:
{
  imports = [
    ./modules/default.nix
    inputs.spicetify-nix.homeManagerModules.default
  ];

  home = {
    username = "noahj";
    homeDirectory = "/home/noahj";
  };

  home.packages = with pkgs; [
    neofetch
    zip
    xz
    unzip
    gh
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg
    nodePackages.vercel
    jetbrains.datagrip
    yaak
    btop
    pciutils
    usbutils
    tofi
    firefox
    obsidian
    kdePackages.dolphin
    pavucontrol
    vesktop
    unstable.zed-editor
    gimp
    steam
    prismlauncher
    mindustry-wayland
    waybar
    nerd-fonts.geist-mono
    gnome-network-displays
    nixd
    nil
    love
    lovely-injector
    grimblast
    libreoffice
    hyprpaper
    teams-for-linux
    cloudflare-warp
    hyprpicker
    upower
    brightnessctl
    bun
    sqlite
    rustc
    pkg-config
    cargo
    gcc
    protobuf
    prettierd
    nixfmt-rfc-style
    nixfmt-tree
    fastfetch
    clipse
    python3
    unstable.shattered-pixel-dungeon
    usbimager
    dig
    heroic
    nmap
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

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };
  home.stateVersion = "25.05";
}
