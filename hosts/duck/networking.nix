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
      ];
    };

    # NetworkManager owns DNS; the generic networking.nameservers only feeds a
    # low-priority resolvconf entry that NM's DHCP answer overrides.
    # MagicDNS goes FIRST: tailscaled cannot win the resolv.conf race against
    # NetworkManager, so without 100.100.100.100 here every *.ts.net name
    # (git.tail608c08.ts.net, svc:*, host names) fails on this host while
    # plain internet DNS keeps working via the entries below.
    networkmanager.insertNameservers = [
      "100.100.100.100"
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
