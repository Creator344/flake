{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./networking.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.cudaSupport = true;

  fileSystems."/drives/2TB" = {
    device = "/dev/disk/by-label/2TB";
    fsType = "ntfs";
    options = [
      "nosuid"
      "nodev"
      "nofail"
      "x-gvfs-show"
      "uid=noahj"
      "gid=users"
      "umask=002"
    ];
  };

  fileSystems."/drives/SSD_STORAGE" = {
    device = "/dev/disk/by-label/SSD_STORAGE";
    fsType = "ntfs";
    options = [
      "nosuid"
      "nodev"
      "nofail"
      "x-gvfs-show"
      "uid=noahj"
      "gid=users"
      "umask=002"
    ];
  };

  time.timeZone = "Pacific/Auckland";

  nixpkgs.config.permittedInsecurePackages = [
    "electron-36.9.5"
  ];

  i18n.defaultLocale = "en_NZ.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_NZ.UTF-8";
    LC_IDENTIFICATION = "en_NZ.UTF-8";
    LC_MEASUREMENT = "en_NZ.UTF-8";
    LC_MONETARY = "en_NZ.UTF-8";
    LC_NAME = "en_NZ.UTF-8";
    LC_NUMERIC = "en_NZ.UTF-8";
    LC_PAPER = "en_NZ.UTF-8";
    LC_TELEPHONE = "en_NZ.UTF-8";
    LC_TIME = "en_NZ.UTF-8";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.noahj = {
    isNormalUser = true;
    description = "Noah Johnson";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
  };

  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    git
    alacritty
    mako
    tofi
    lsscsi
    cudatoolkit
  ];

  virtualisation.docker = {
    enable = true;
  };

  hardware.nvidia-container-toolkit = {
    enable = true;
  };

  virtualisation.oci-containers = {
    backend = "docker";
    containers = {
      arm = {
        image = "automaticrippingmachine/automatic-ripping-machine:latest";
        ports = [ "127.0.0.1:8080:8080" ];
        environment = {
          ARM_UID = "1000";
          ARM_GID = "100";
          NVIDIA_DRIVER_CAPABILITIES = "all";
          TIMEZONE = "Pacific/Auckland";
        };
        volumes = [
          "/drives/2TB/arm:/home/arm"
          "/drives/2TB/arm/Music:/home/arm/Music"
          "/drives/2TB/arm/logs:/home/arm/logs"
          "/drives/2TB/media:/home/arm/media"
          "/drives/2TB/arm/config:/etc/arm/config"
        ];
        devices = [
          "/dev/sr0:/dev/sr0"
          "nvidia.com/gpu=all"
        ];
        privileged = true;
        hostname = "arm";
        autoStart = true;
      };
    };
  };

  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        security = "user";
      };
      "movies" = {
        "path" = "/drives/2TB/media/completed/movies";
        "browsable" = "yes";
        "read only" = "yes";
        "guest ok" = "yes";
      };
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  services.flatpak.enable = true;

  services.openssh.enable = true;

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      mesa
      vulkan-loader
      vulkan-validation-layers
      vulkan-tools
    ];

    extraPackages32 = with pkgs.pkgsi686Linux; [
      mesa
      vulkan-loader
    ];
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
}
