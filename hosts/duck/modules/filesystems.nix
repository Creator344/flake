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
      # Owner-writable, world-readable: enough for the Samba share and for the
      # agent's log account to see media without handing every local process
      # write access to the library.
      "umask=0022"
    ];
  };
in
{
  fileSystems."/drives/2TB" = ntfsDrive "2TB";
  fileSystems."/drives/SSD_STORAGE" = ntfsDrive "SSD_STORAGE";
}
