_: {
  users.users.noahj = {
    isNormalUser = true;
    # Keeps the user manager (and therefore home-manager's services) running
    # without an active login session.
    linger = true;
    # Name only: this repo is public and the login name already says it.
    description = "noahj";
    # No "docker" (docker is not enabled on this host) and no "libvirt"
    # (nothing enables libvirtd): a group membership for a service that does
    # not run grants nothing and reads as if it does.
    extraGroups = [
      "networkmanager"
      "wheel"
      "uinput"
      "video"
    ];
  };
}
