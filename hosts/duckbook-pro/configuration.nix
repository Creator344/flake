{ ... }@inputs:
{
  users.users.noahj = {
    home = "/Users/noahj";
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  nix.enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Allow broken packages
  nixpkgs.config.allowBroken = true;

  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;

  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;

  system.primaryUser = "noahj";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;

  # The platform the configuration will be used on.
  nixpkgs.hostPlatform = "aarch64-darwin";

  nixpkgs.overlays = [
    (final: prev: {
      pythonPackagesExtensions = (prev.pythonPackagesExtensions or [ ]) ++ [
        (python-final: python-prev: {
          accelerate = python-prev.accelerate.overrideAttrs (_: {
            doCheck = false;
          });
        })
      ];
    })
  ];

  homebrew = {
    enable = true;
    brews = [
      # Development
      "atuin"
      "cocoapods"
      # Documents
      "pandoc"
      "librsvg"
    ];
    casks = [
      # CAD Software
      "kicad"
      # CLI
      "jandedobbeleer/oh-my-posh/oh-my-posh"
      # Crypto
      "monero-wallet"
      # Desktop
      "xquartz"
      # Development
      "android-studio"
      "zed"
      # Documents
      "homebrew/cask/basictex"
      # Fonts
      "font-geist-mono-nerd-font"
      "font-lilex-nerd-font"
      # Game Development
      "godot"
      "unity-hub"
      # Games
      "moonlight"
      "openemu"
      "prismlauncher"
      "roblox"
      "robloxstudio"
      "steam"
      # General
      "raycast"
      # Networking
      "cloudflare-warp"
      # Organisation
      "activitywatch"
      # Web Browsing
      "helium-browser"
      # Window Managers
      "glide"
    ];
  };
}
