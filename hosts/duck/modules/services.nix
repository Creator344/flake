{ pkgs, ... }: {
  # --- remote access -------------------------------------------------------
  services.openssh = {
    enable = true;
    settings = {
      # Wayland-only host with no X clients: forwarding is pure attack surface.
      X11Forwarding = false;
      # argo-logs exists only for `ssh ... cat /var/log/nixos-rebuild.log`;
      # naming the two accounts keeps the door that precise.
      AllowUsers = [
        "noahj"
        "argo-logs"
      ];
    };
  };

  # Game streaming (Moonlight client side).
  services.sunshine = {
    enable = true;
    package = pkgs.sunshine.override {
      cudaSupport = true;
      inherit (pkgs) cudaPackages;
    };
    autoStart = true;
    # Required for screen capture on umbriel (Wayland); without it sunshine
    # cannot read the compositor's output. This is the box's largest single
    # privilege grant — keep it only while sunshine is in use.
    capSysAdmin = true;
    openFirewall = true;
  };

  # --- peripherals ---------------------------------------------------------
  # iOS device access over USB.
  services.usbmuxd.enable = true;

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed
    ];
  };

  # --- media shares --------------------------------------------------------
  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        security = "user";
        # Without this, `guest ok = yes` under security = user just rejects
        # anonymous clients instead of mapping them to guest.
        "map to guest" = "bad user";
      };
      "movies" = {
        "path" = "/drives/2TB/media/completed/movies";
        "browsable" = "yes";
        "read only" = "yes";
        "guest ok" = "yes";
      };
    };
  };
}
