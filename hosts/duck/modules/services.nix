{ pkgs, ... }: {
  # --- remote access -------------------------------------------------------
  services.openssh = {
    enable = true;
    settings.X11Forwarding = true;
  };

  # Game streaming (Moonlight client side).
  services.sunshine = {
    enable = true;
    package = pkgs.sunshine.override {
      cudaSupport = true;
      inherit (pkgs) cudaPackages;
    };
    autoStart = true;
    capSysAdmin = true; # only needed for Wayland -- omit this when using with Xorg
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
