{
  networking = {
    hostName = "duck";
    networkmanager.enable = true;

    firewall = {
      allowedTCPPorts = [
        22
        80
        49160
        25565
      ];
      allowedUDPPorts = [
        38274
        40759
        8080
      ];
    };

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
    ];


    firewall.allowPing = true;
  };

  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    tailscale = {
      enable = true;
      useRoutingFeatures = "both";
    };
  };
}
