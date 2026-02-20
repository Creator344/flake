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
    casks = [
      # Containerisation
      "docker-desktop"
      # Development
      "zed"
      # Game Development
      "godot"
      "unity-hub"
      # Games
      "roblox"
      "robloxstudio"
      "steam"
      # General
      "raycast"
      # Networking
      "cloudflare-warp"
      # Password Manager
      "bitwarden"
      # Web Browsing
      "helium-browser"
    ];
  };
}
