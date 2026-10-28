_: {
  users.users.noahj = {
    isNormalUser = true;
    # Keeps the user manager (and therefore home-manager's services) running
    # without an active login session.
    linger = true;
    description = "Noah Johnson";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "uinput"
      "video"
      "libvirt"
    ];
  };
}
