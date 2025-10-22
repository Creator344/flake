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

    wg-quick.interfaces = {
      woldemure = {
        privateKeyFile = "/home/noahj/wireguard-keys/privatekey";
        address = [
          "10.66.67.2/32"
          "fd42:42:43::2/128"
        ];
        mtu = 1380;
        listenPort = 38274;
        peers = [
          {
            publicKey = "yphSocz6NN8xSJCOdhFeikiiw2Dm/NreQwZnUAB9Dno=";
            endpoint = "73.44.20.131:51820";
            allowedIPs = [
              "10.66.67.2/32"
              "fd42:42:43::2/128,10.0.0.190/32"
            ];
            persistentKeepalive = 15;
          }
        ];
      };
    };
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
