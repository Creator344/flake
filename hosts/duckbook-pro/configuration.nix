{ ... }@inputs:
{
  users.users.noahj = {
    home = "/Users/noahj";
  };

  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";

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



  homebrew = {
    enable = true;
    brews = [
      # Development
      "atuin"
      "cocoapods"
      # Documents
      "pandoc"
      "librsvg"
      # Window Managers
      "asmvik/formulae/yabai"
    ];
    casks = [
      # CLI 
      "jandedobbeleer/oh-my-posh/oh-my-posh"
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
      "openemu"
      "roblox"
      "robloxstudio"
      "steam"
      # General
      "raycast"
      # Networking
      "cloudflare-warp"
      # Organisation
      "activitywatch"
      # Password Manager
      "bitwarden"
      # Web Browsing
      "helium-browser"
    ];
  };
  imports = [ ./ollama.nix ];
  services.ollama = {
    enable = true;
  };
}
