# Extra drives. Both are shared NTFS volumes mounted for the desktop user via
# gvfs (`x-gvfs-show` puts them in the file manager sidebar).
let
  # Same mount contract for every NTFS volume: no device nodes or setuid
  # binaries off a Windows-formatted disk, and `nofail` so a missing disk
  # cannot wedge boot.
  ntfsDrive = label: {
    device = "/dev/disk/by-label/${label}";
    fsType = "ntfs";
    options = [
      "nosuid"
      "nodev"
      "nofail"
      "x-gvfs-show"
      "uid=noahj"
      "gid=users"
      "umask=000"
    ];
  };
in
{
  fileSystems."/drives/2TB" = ntfsDrive "2TB";
  fileSystems."/drives/SSD_STORAGE" = ntfsDrive "SSD_STORAGE";
}
