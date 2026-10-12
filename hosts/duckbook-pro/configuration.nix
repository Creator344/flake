{ inputs, ... }:
{
  users.users.noahj = {
    home = "/Users/noahj";
  };

  nix.settings.experimental-features = "nix-command flakes";

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
  };

  # Set Git commit hash for darwin-version.
  system = {
    configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
    primaryUser = "noahj";
    stateVersion = 6;
  };

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
      "vscodium"
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
      # DAW Plugins
      "surge-xt"
      # Messaging
      "equibop"
      # Networking
      "cloudflare-warp"
      # Password Manager
      "bitwarden"
      # Remote Access
      "parsec"
      # Web Browser
      "floorp"

      "raycast"
    ];
  };
}
