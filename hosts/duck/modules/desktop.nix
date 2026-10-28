{ pkgs, ... }: {
  # umbriel is the Wayland compositor; noctalia-greeter is its login screen.
  programs.umbriel.enable = true;

  services.displayManager.noctalia-greeter = {
    enable = true;
    settings = {
      user.default = "noahj";
      appearance = {
        scheme = "Synced";
        hide_logo = true;
      };
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # Flatpak for apps that only ship that way; gnome-keyring backs its secrets
  # and the browser/SSH key agents.
  services.flatpak.enable = true;
  services.gnome.gnome-keyring.enable = true;
}
