{ config, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # OBS virtual cam. Lives here rather than in hardware-configuration.nix so
  # `nixos-generate-config` can't silently drop it.
  boot.kernelModules = [ "v4l2loopback" ];
  # From the kernel's own package set so the module matches the running kernel.
  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
  boot.extraModprobeConfig = ''
    options v4l2loopback devices=2 video_nr=1,2 card_label="OBS Cam, Virt Cam" exclusive_caps=1
  '';
}
